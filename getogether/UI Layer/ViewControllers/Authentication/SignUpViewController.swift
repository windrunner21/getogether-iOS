//
//  SignUpViewController.swift
//  getogether
//
//  Created by Imran Hajiyev on 12.04.23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var registerButtonBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.fullNameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
                
        configureKeyboardNotifications()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case fullNameTextField:
            self.emailTextField.becomeFirstResponder()
        case emailTextField:
            self.passwordTextField.becomeFirstResponder()
        case passwordTextField:
            self.passwordTextField.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    func configureKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if fullNameTextField.isEditing || emailTextField.isEditing || passwordTextField.isEditing {
            moveWithKeyboard(on: notification, move: self.registerButtonBottomConstraint, if: true, by: 30)
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        moveWithKeyboard(on: notification, move: self.registerButtonBottomConstraint, if: false, by: 30)
    }
    
    
    @IBAction func onRegister(_ sender: Any) {
        guard let fullName = fullNameTextField.text else {  fullNameTextField.layer.borderColor = ColorEnum.error.cgColor; return }
        guard let email = emailTextField.text else { emailTextField.layer.borderColor = ColorEnum.error.cgColor; return }
        guard let password = passwordTextField.text else { passwordTextField.layer.borderColor = ColorEnum.error.cgColor; return }
        
        if !email.isEmpty && !password.isEmpty {
            EmailAuth(email: email, password: password, providedBy: RealmEmailAuth()).login()
        } else {
            if fullName.isEmpty {
                fullNameTextField.layer.borderColor = ColorEnum.error.cgColor
            }
            
            if email.isEmpty {
                emailTextField.layer.borderColor = ColorEnum.error.cgColor
            }
            
            if password.isEmpty {
                passwordTextField.layer.borderColor = ColorEnum.error.cgColor
            }
        }
    }
}
