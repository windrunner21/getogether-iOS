//
//  Email Auth.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

import RealmSwift
import Realm

class RealmEmailAuth: EmailAuthenticationProvider {
    internal var user: User = User()
    
    private let app = RealmAPIClient().getApp()
    private let client = RealmAPIClient().getApp().emailPasswordAuth
    
    private var email: String
    private var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func login() {
        let credentials = Credentials.emailPassword(email: email, password: password)
        
        app.login(credentials: credentials) { (result) in
            switch result {
            case .failure(let error):
                print("Realm: login failed: \(error.localizedDescription)")
            case .success(let realmUser):
                print("Realm: successfully logged in as user: \(realmUser.id)")
                self.setUser(realmUser)
            }
        }
    }
    
    func login(completion: @escaping (Result<User, Error>) -> Void) {
        let credentials = Credentials.emailPassword(email: email, password: password)
        
        app.login(credentials: credentials) { (result) in
            let refactoredResult: Result<User, Error> = result.map { realmUser in
                let user = User()
                user.setId(realmUser.id)
                user.setLoggedIn(realmUser.isLoggedIn)
                return user
            }.mapError { error in
                return error
            }
            
            completion(refactoredResult)
        }
    }
    
    func register(completion: @escaping (Result<User, Error>) -> Void) {
        client.registerUser(email: email, password: password) { (error) in
            
            if error != nil {
                print("Realm: failed to register: \(error!.localizedDescription)")
                let result: Result<User, Error> = .failure(error!)
                completion(result)
            } else {
                print("Realm: successfully registered user.")
                self.login(completion: completion)
            }
        }
    }
    
    func register() {
        client.registerUser(email: email, password: password) { (error) in
            guard error == nil else {
                print("Realm: failed to register: \(error!.localizedDescription)")
                return
            }
            
            print("Realm: successfully registered user.")
            self.login()
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
