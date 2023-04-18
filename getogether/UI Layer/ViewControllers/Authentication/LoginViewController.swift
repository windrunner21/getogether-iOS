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

        let emailAuthenticationProvider: EmailAuthenticationProvider = RealmEmailAuth(email: email, password: password)
        let emailAuthentication: EmailAuthentication = EmailAuthentication(provider: emailAuthenticationProvider)

        if !email.isEmpty && !password.isEmpty {
            setLoading(true)
            
            emailAuthentication.login() { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .failure(let error):
                        print("Login failed: \(error.localizedDescription)")
                    case .success(let user):
                        print("Successfully logged in as user: \(user.getId()!)")
                        print(user.isUserLoggedIn())
                    }
                    
                    self?.setLoading(false)
                }
            }
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
