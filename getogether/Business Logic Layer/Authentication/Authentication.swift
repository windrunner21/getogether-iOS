//
//  Authentication.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

protocol Authentication {
    func login() -> User
    func login(completion: @escaping (Result<User, Error>) -> Void)
    func register() -> User
    func register(completion: @escaping (Result<User, Error>) -> Void)
}
