//
//  Email Auth.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

import RealmSwift

class RealmEmailAuth: AuthProvider {
    private let apiClient = RealmAPIClient().getApp()
    
    func login(email: String, password: String) {
        apiClient.login(credentials: Credentials.emailPassword(email: email, password: password)) { (result) in
            switch result {
            case .failure(let error):
                print("Login failed: \(error.localizedDescription)")
            case .success(let user):
                print("Successfully logged in as user: \(user)")
            }
        }
    }
}
