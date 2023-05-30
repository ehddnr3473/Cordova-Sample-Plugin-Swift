//
//  KeyPadViewController.swift
//  Sample
//
//  Created by 김동욱 on 2023/05/30.
//

import UIKit

final class KeyPadViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var num1Button: UIButton!
    @IBOutlet weak var num2Button: UIButton!
    @IBOutlet weak var num3Button: UIButton!
    @IBOutlet weak var num4Button: UIButton!
    @IBOutlet weak var num5Button: UIButton!
    @IBOutlet weak var num6Button: UIButton!
    @IBOutlet weak var num7Button: UIButton!
    @IBOutlet weak var num8Button: UIButton!
    @IBOutlet weak var num9Button: UIButton!
    @IBOutlet weak var num0Button: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    weak var delegate: PasswordDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayoutConstraints()
    }
}

private extension KeyPadViewController {
    // MARK: - Configure Views
    func configureLayoutConstraints() {
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        num1Button.translatesAutoresizingMaskIntoConstraints = false
        num2Button.translatesAutoresizingMaskIntoConstraints = false
        num3Button.translatesAutoresizingMaskIntoConstraints = false
        num4Button.translatesAutoresizingMaskIntoConstraints = false
        num5Button.translatesAutoresizingMaskIntoConstraints = false
        num6Button.translatesAutoresizingMaskIntoConstraints = false
        num7Button.translatesAutoresizingMaskIntoConstraints = false
        num8Button.translatesAutoresizingMaskIntoConstraints = false
        num9Button.translatesAutoresizingMaskIntoConstraints = false
        num0Button.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let keyWidth = screenWidth / 3.0
        let keyHeight = screenHeight / 2.0 / 5.0
        
        NSLayoutConstraint.activate([
            passwordLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            passwordLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            passwordLabel.trailingAnchor.constraint(equalTo: resetButton.leadingAnchor, constant: -8),
            
            num1Button.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 50),
            num1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            num1Button.widthAnchor.constraint(equalToConstant: keyWidth),
            num1Button.heightAnchor.constraint(equalToConstant: keyHeight),
            
            num2Button.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 50),
            num2Button.leadingAnchor.constraint(equalTo: num1Button.trailingAnchor),
            num2Button.widthAnchor.constraint(equalToConstant: keyWidth),
            num2Button.heightAnchor.constraint(equalToConstant: keyHeight),
            
            num3Button.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 50),
            num3Button.leadingAnchor.constraint(equalTo: num2Button.trailingAnchor),
            num3Button.widthAnchor.constraint(equalToConstant: keyWidth),
            num3Button.heightAnchor.constraint(equalToConstant: keyHeight),
            
            num4Button.topAnchor.constraint(equalTo: num1Button.bottomAnchor),
            num4Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            num4Button.widthAnchor.constraint(equalToConstant: keyWidth),
            num4Button.heightAnchor.constraint(equalToConstant: keyHeight),
            
            num5Button.topAnchor.constraint(equalTo: num1Button.bottomAnchor),
            num5Button.leadingAnchor.constraint(equalTo: num4Button.trailingAnchor),
            num5Button.widthAnchor.constraint(equalToConstant: keyWidth),
            num5Button.heightAnchor.constraint(equalToConstant: keyHeight),
            
            num6Button.topAnchor.constraint(equalTo: num1Button.bottomAnchor),
            num6Button.leadingAnchor.constraint(equalTo: num5Button.trailingAnchor),
            num6Button.widthAnchor.constraint(equalToConstant: keyWidth),
            num6Button.heightAnchor.constraint(equalToConstant: keyHeight),
            
            num7Button.topAnchor.constraint(equalTo: num4Button.bottomAnchor),
            num7Button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            num7Button.widthAnchor.constraint(equalToConstant: keyWidth),
            num7Button.heightAnchor.constraint(equalToConstant: keyHeight),
            
            num8Button.topAnchor.constraint(equalTo: num4Button.bottomAnchor),
            num8Button.leadingAnchor.constraint(equalTo: num7Button.trailingAnchor),
            num8Button.widthAnchor.constraint(equalToConstant: keyWidth),
            num8Button.heightAnchor.constraint(equalToConstant: keyHeight),
            
            num9Button.topAnchor.constraint(equalTo: num4Button.bottomAnchor),
            num9Button.leadingAnchor.constraint(equalTo: num8Button.trailingAnchor),
            num9Button.widthAnchor.constraint(equalToConstant: keyWidth),
            num9Button.heightAnchor.constraint(equalToConstant: keyHeight),
            
            num0Button.topAnchor.constraint(equalTo: num8Button.bottomAnchor),
            num0Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            num0Button.widthAnchor.constraint(equalToConstant: keyWidth),
            num0Button.heightAnchor.constraint(equalToConstant: keyHeight),
            
            deleteButton.topAnchor.constraint(equalTo: num8Button.bottomAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: num0Button.trailingAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: keyWidth),
            deleteButton.heightAnchor.constraint(equalToConstant: keyHeight)
        ])
    }
    
    // MARK: - Configure actions
    @IBAction func touchUpResetButton() {
        passwordLabel.text = ""
    }
    
    @IBAction func touchUpCancelButton() {
        dismiss(animated: true)
    }


    @IBAction func touchUpSendButton(_ sender: Any) {
        delegate?.changeText(with: passwordLabel.text ?? "")
        dismiss(animated: true)
    }
    
    func appendText(with passwordChar: String) {
        if let text = passwordLabel.text, text.count < 10 {
            let appendedText = text + passwordChar
            passwordLabel.text = appendedText
        }
    }
    
    @IBAction func touchUpNum1Button() {
        appendText(with: "1")
    }
    
    @IBAction func touchUpNum2Button() {
        appendText(with: "2")
    }
    
    @IBAction func touchUpNum3Button() {
        appendText(with: "3")
    }
    
    @IBAction func touchUpNum4Button() {
        appendText(with: "4")
    }
    
    @IBAction func touchUpNum5Button() {
        appendText(with: "5")
    }
    
    @IBAction func touchUpNum6Button() {
        appendText(with: "6")
    }
    
    @IBAction func touchUpNum7Button() {
        appendText(with: "7")
    }
    
    @IBAction func touchUpNum8Button() {
        appendText(with: "8")
    }
    
    @IBAction func touchUpNum9Button() {
        appendText(with: "9")
    }
    
    @IBAction func touchUpNum0Button() {
        appendText(with: "0")
    }
    
    @IBAction func touchUpDeleteButton() {
        if let text = passwordLabel.text {
            if text.count > 0 {
                let trimmedText = String(text.dropLast())
                passwordLabel.text = trimmedText
            }
        }
    }
}

