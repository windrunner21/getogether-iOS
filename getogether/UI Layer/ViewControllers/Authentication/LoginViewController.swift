//
//  LoginViewController.swift
//  getogether
//
//  Created by Imran Hajiyev on 12.04.23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var loginButtonBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        configureKeyboardNotifications()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
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
        if emailTextField.isEditing || passwordTextField.isEditing {
            moveWithKeyboard(on: notification, move: self.loginButtonBottomConstraint, if: true, by: 30)
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        moveWithKeyboard(on: notification, move: self.loginButtonBottomConstraint, if: false, by: 30)
    }
    
    @IBAction func onLogin(_ sender: Any) {
        guard let email = emailTextField.text else { emailTextField.layer.borderColor = ColorEnum.error.cgColor; return }
        guard let password = passwordTextField.text else { passwordTextField.layer.borderColor = ColorEnum.error.cgColor; return }

        let authenticationProvider: AuthProvider = RealmEmailAuth()
        let emailAuth: EmailAuth = EmailAuth(email: email, password: password, provider: authenticationProvider)

        if !email.isEmpty && !password.isEmpty {
//            setLoading(true)
            let user = emailAuth.login()
            print(user.getId() ?? "Failed")
//            setLoading(false)
        } else {
            if email.isEmpty {
                emailTextField.layer.borderColor = ColorEnum.error.cgColor
            }

            if password.isEmpty {
                passwordTextField.layer.borderColor = ColorEnum.error.cgColor
            }
        }
    }
    
    private func setLoading(_ loading: Bool) {
        if loading {
            loginButton.configuration?.showsActivityIndicator = true
        } else {
            loginButton.configuration?.showsActivityIndicator = false
        }
    }
}
