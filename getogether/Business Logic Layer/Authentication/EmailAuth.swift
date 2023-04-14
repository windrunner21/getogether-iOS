//
//  Email Auth.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

class EmailAuth: Authentication {
    internal var provider: AuthProvider
    
    private var email: String
    private var password: String
    
    init(email: String, password: String, providedBy provider: AuthProvider) {
        self.email = email
        self.password = password
        self.provider = provider
    }
    
    func login() {
        switch provider {
        case is RealmEmailAuth:
            RealmEmailAuth().login(email: self.email, password: self.password)
        default:
            print("Warning: Authentication provider was not selected.")
        }
        
    }
    
    func register() {
        switch provider {
        case is RealmEmailAuth:
            RealmEmailAuth().login(email: self.email, password: self.password)
        default:
            print("Warning: Authentication provider was not selected.")
        }
    }
}
