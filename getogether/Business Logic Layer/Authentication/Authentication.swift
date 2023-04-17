//
//  Authentication.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

protocol Authentication {
    func login() -> User
    func register() -> User
}
