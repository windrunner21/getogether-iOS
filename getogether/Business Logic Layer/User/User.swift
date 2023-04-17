//
//  User.swift
//  getogether
//
//  Created by Imran Hajiyev on 17.04.23.
//

class User {    
    private var id: String? = nil
    private var isLoggedIn: Bool = false
    
    internal func setId(_ id: String) {
        self.id = id
    }
    
    internal func setLoggedIn(_ status: Bool) {
        self.isLoggedIn = status
    }
    
    internal func getId() -> String? {
        self.id
    }
    
    internal func isUserLoggedIn() -> Bool {
        self.isLoggedIn
    }
}
