//
//  Realm API Client.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

import Realm
import RealmSwift

class RealmAPIClient {
    private let app = App(id: "getogether-cbphr")
    
    func getApp() -> RLMApp {
        app
    }
}
