//
//  ViewController.swift
//  getogether
//
//  Created by Imran Hajiyev on 12.04.23.
//

import UIKit

class AuthenticationViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
    }
    
    @IBAction func onLogin(_ sender: Any) {
        let loginStoryboard: UIStoryboard = UIStoryboard(name: "LoginScreen", bundle: .main)
        let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: "LoginScreen")
        self.present(loginViewController, animated: true)
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let signUpStoryboard: UIStoryboard = UIStoryboard(name: "RegisterScreen", bundle: .main)
        let signUpViewController = signUpStoryboard.instantiateViewController(withIdentifier: "RegisterScreen")
        self.present(signUpViewController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) {
    }
}
