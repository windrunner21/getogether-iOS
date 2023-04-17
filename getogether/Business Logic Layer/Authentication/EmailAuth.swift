//
//  Email Auth.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

class EmailAuth: Authentication {    
    private var provider: AuthProvider
    private var email: String
    private var password: String
    
    init(email: String, password: String, provider: AuthProvider) {
        self.email = email
        self.password = password
        self.provider = provider
    }
    
    func login() -> User {
        provider.loginWithEmailPassword(email: self.email, password: self.password)
        return provider.user
    }
    
    func register() -> User {
        provider.registerWithEmailPassword(email: self.email, password: self.password)
        return provider.user
    }
}
