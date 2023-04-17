//
//  AuthProvider.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

protocol AuthProvider {
    var user: User { get }
    
    func loginWithEmailPassword(email: String, password: String)
    func login()
    
    func registerWithEmailPassword(email: String, password: String)
    func register()
}

extension AuthProvider {
    func loginWithEmailPassword(email: String, password: String) {}
    func login() {}
    
    func registerWithEmailPassword(email: String, password: String) {}
    func register() {}
}
