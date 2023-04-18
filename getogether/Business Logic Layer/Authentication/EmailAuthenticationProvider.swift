//
//  AuthProvider.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

protocol EmailAuthenticationProvider {
    var user: User { get }

    func login(completion: @escaping (Result<User, Error>) -> Void)
    func login()
    func register(completion: @escaping (Result<User, Error>) -> Void)
    func register()
}

