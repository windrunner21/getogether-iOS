//
//  Authentication.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

protocol Authentication {
    var provider: AuthProvider { get set }
    
    func login()
    
    func register()
}
