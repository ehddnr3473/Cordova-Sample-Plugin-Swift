//
//  PasswordViewController.swift
//  HelloWorld
//
//  Created by 김동욱 on 2023/05/30.
//

import UIKit

protocol PasswordDelegate: AnyObject {
    func changeText(with password: String)
}

final class PasswordViewController: UIViewController {
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var presentKeyPadViewButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    weak var delegate: KeyPadResultDelegate?
    var callbackId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpPresentKeyPadViewButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "KeyPad", bundle: nil)
        guard let keyPadViewController = storyboard.instantiateViewController(withIdentifier: "KeyPad") as? KeyPadViewController else { return }
        keyPadViewController.delegate = self
        present(keyPadViewController, animated: true)
        
        if passwordLabel.text != "패스워드를 입력하세요." {
            keypadViewController.passwordLabel.text = passwordLabel.text
        }
    }
    
    @IBAction func touchUpSendButton() {
        delegate?.sendResult(with: passwordLabel.text ?? "", callbackId: callbackId)
        dismiss(animated: true)
    }
}

extension PasswordViewController: PasswordDelegate {
    func changeText(with password: String) {
        DispatchQueue.main.async {
            self.passwordLabel.text = password
        }
    }
}
