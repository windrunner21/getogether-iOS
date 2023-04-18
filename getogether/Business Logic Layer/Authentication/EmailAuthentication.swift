//
//  Email Auth.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

class EmailAuthentication: Authentication {
    private var provider: EmailAuthenticationProvider
    
    init(provider: EmailAuthenticationProvider) {
        self.provider = provider
    }
    
    func login() -> User {
        provider.login()
        return provider.user
    }
    
    func login(completion: @escaping (Result<User, Error>) -> Void) {
        provider.login(completion: completion)
    }
    
    func register() -> User {
        provider.register()
        return provider.user
    }
    
    func register(completion: @escaping (Result<User, Error>) -> Void) {
        provider.register(completion: completion)
    }
}
