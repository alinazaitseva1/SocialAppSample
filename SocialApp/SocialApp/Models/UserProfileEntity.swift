//
//  UserProfileEntity.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/20/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class UserProfileEntity{
    
    // MARK: - Constants and Variables
    
    var id          : Int!
    var name        : String!
    var firstName   : String!
    var lastName    : String!
    var userName    : String?
    var age         : Int!
    var country     : String!
    var address     : String!
    var isOnline    : Bool!
    //var connectionType : String?
    var isFollower  : Bool!
    var isFollowing : Bool!
}

struct Counters {
    
    var friends   : Int!
    var followers : Int!
    var tags      : Int!
    var posts     : Int!
    var photos    : Int!
    var videos    : Int!
}
