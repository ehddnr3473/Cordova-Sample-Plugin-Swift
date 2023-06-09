//
//  CordovaSamplePluginSwift.swift
//  
//
//  Created by 김동욱 on 2023/05/25.
//

@objc(CordovaSamplePluginSwift)
final class CordovaSamplePluginSwift: CDVPlugin {
    @objc(greet:)
    func greet(command: CDVInvokedUrlCommand) {
        print("Received successfully.")
        print("callbackId: \(command.callbackId as String)")
        print("className: \(command.className as String)")
        print("methodName: \(command.methodName as String)")
        print("arguments: \(String(describing: command.arguments))")
        
        let result = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "Hi, I'm a Yeolmok on iOS platform")
        self.commandDelegate.send(result, callbackId: command.callbackId)
    }
    
    @objc(presentModalView:)
    func presentModalView(_ command: CDVInvokedUrlCommand) {
        print("presentModalView: called.")
        
        let viewController = UIViewController()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello world!"
        label.font = .boldSystemFont(ofSize: 25)
        
        viewController.view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor)
        ])
        
        viewController.view.backgroundColor = .systemPink
        viewController.modalPresentationStyle = .popover
        
        self.viewController.present(viewController, animated: true) { [weak self] in
            let result = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "ModalView came up.")
            self?.commandDelegate.send(result, callbackId: command.callbackId)
        }
    }
    
    @objc(presentPasswordView:)
    func presentPasswordView(command: CDVInvokedUrlCommand) {
        let storyboard = UIStoryboard(name: "Password", bundle: nil)
        guard let passwordViewController = storyboard.instantiateViewController(withIdentifier: "Password") as? PasswordViewController else { return }
        passwordViewController.modalPresentationStyle = .formSheet
        passwordViewController.callbackId = command.callbackId
        passwordViewController.delegate = self
        self.viewController.present(passwordViewController, animated: true)
    }
}

// MARK: - KeyPadResultDelegate
protocol KeyPadResultDelegate: AnyObject {
    func sendResult(with password: String, callbackId: String)
}

extension CordovaSamplePluginSwift: KeyPadResultDelegate {
    func sendResult(with password: String, callbackId: String) {
        self.commandDelegate.send(
            CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAs: password
            ),
            callbackId: callbackId
        )
    }
}
