//
//  Email Auth.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

import RealmSwift
import Realm

class RealmEmailAuth: AuthProvider {
    internal var user: User = User()
    private let apiClient = RealmAPIClient().getApp()
    
    func loginWithEmailPassword(email: String, password: String) {
        let credentials = Credentials.emailPassword(email: email, password: password)
        
        apiClient.login(credentials: credentials) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("Login failed: \(error.localizedDescription)")
                case .success(let user):
                    print("Successfully logged in as user: \(user.id)")
                    self?.setUser(user)
                    print(self?.user.isUserLoggedIn())
                }
            }
        }
    }
    
    func registerWithEmailPassword(email: String, password: String) {
        apiClient.emailPasswordAuth.registerUser(email: email, password: password) { (error) in
            guard error == nil else {
                print("Register failed: \(error!.localizedDescription)")
                return
            }
            
            print("Successfully registered user.")
        }
    }

    private func setUser(_ realmUser: RLMUser) {
        self.user.setId(realmUser.id)
        self.user.setLoggedIn(realmUser.isLoggedIn)
    }
    
    internal func getUser() -> User? {
        self.user
    }
}
