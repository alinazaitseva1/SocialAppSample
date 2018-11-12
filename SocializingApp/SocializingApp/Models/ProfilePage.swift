//
//  Profile.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/9/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

struct ProfilePage: Codable {
    
    // MARK: - Vars
    
    var count      : Int?
    var results    : [Profile]!
}

struct Profile: Codable {
    
    // MARK: - Vars
    
    var id        : Int!
    var avatar    : URL?
    var firstName : String!
    var lastName  : String!
    var userName  : String?
    var age       : Int!
    var location  : Location!
    var isOnline  : Bool!
    var counters  : Counters!
    
    // MARK: - Custom vars
    
    var isMine: Bool {
        return self.id == UserDefaults.standard.integer(forKey: UserDefaultsKeys.userId.rawValue)
    }
    
    var getFullName: String {
        return "\(firstName!) \(lastName!)"
    }
}

struct Location: Codable {
    
    // MARK: - Vars
    
    var country: String!
    var address: String!
}

struct Counters: Codable {
    
    // MARK: - Const
    
    static var count = 6 // amount of items in Counters Struct
    
    // MARK: - Vars
    
    var friends   : Int!
    var followers : Int!
    var tags      : Int!
    var posts     : Int!
    var photos    : Int!
    var videos    : Int!
}
