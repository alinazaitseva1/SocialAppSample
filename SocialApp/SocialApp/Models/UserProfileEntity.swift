//
//  UserProfileEntity.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/20/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit
import Foundation

struct Counters: Codable {
    
    // MARK: - Constants and Variables
    
    static var count = 6 // amount of items in Counters Structure
    
    var friends   : Int!
    var followers : Int!
    var tags      : Int!
    var posts     : Int!
    var photos    : Int!
    var videos    : Int!
    
    private enum CodingKeys: String, CodingKey {
        
        case friends
        case followers
        case tags
        case posts
        case photos
        case videos
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        friends   = try values.decode(Int.self, forKey: .friends)
        followers = try values.decode(Int.self, forKey: .followers)
        tags      = try values.decode(Int.self, forKey: .tags)
        posts     = try values.decode(Int.self, forKey: .posts)
        photos    = try values.decode(Int.self, forKey: .photos)
        videos    = try values.decode(Int.self, forKey: .videos)
        
    }
    
}


class UserProfileEntity: Codable {
    
    // MARK: - Constants and Variables
    
    var id          : Int!
    var avatar      : URL?
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
    var counters: Counters!
    
    // MARK: - Custom vars
    
    var getFullName: String {
        return "\(firstName!) \(lastName!)"
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case id
        
        case firstName = "first_name"
        case lastName = "last_name"
        case userName = "username"
        case avatar
        
        case age
        case location
        case isOnline = "is_online"
        
        case isFollower = "is_follower"
        case isFollowing = "is_following"
        case counters
        
        enum Location: String, CodingKey {
            case country
            case address
        }
        
    }
    
    
    required init(from decoder: Decoder) throws {
        
        let values   = try decoder.container(keyedBy: CodingKeys.self)
        let locationContainer = try values.nestedContainer(keyedBy: CodingKeys.Location.self, forKey: .location)
        
        firstName   = try values.decode(String.self, forKey: .firstName)
        lastName    = try values.decode(String.self, forKey: .lastName)
        
        avatar      = try values.decodeIfPresent(URL.self, forKey: .avatar)
        userName    = try values.decodeIfPresent(String.self, forKey: .userName)
        
        age         = try values.decode(Int.self, forKey: .age)
        country     = try locationContainer.decode(String.self, forKey: .country)
        address     = try locationContainer.decode(String.self, forKey: .address)
        isOnline    = try values.decode(Bool.self, forKey: .isOnline)
        isFollower  = try values.decode(Bool.self, forKey: .isFollower)
        isFollowing = try values.decode(Bool.self, forKey: .isFollowing)
        counters    = try values.decode(Counters.self, forKey: .counters)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var locationContainer = container.nestedContainer(keyedBy: CodingKeys.Location.self, forKey: .location)
        
        
        try container.encodeIfPresent(firstName, forKey: .firstName)
        try container.encodeIfPresent(lastName, forKey: .lastName)
        
        try container.encode(avatar, forKey: .avatar)
        try container.encode(userName, forKey: .userName)
        
        try container.encodeIfPresent(age, forKey: .age)
        try locationContainer.encodeIfPresent(country, forKey: .country)
        try locationContainer.encodeIfPresent(address, forKey: .address)
        try container.encodeIfPresent(isOnline, forKey: .isOnline)
        try container.encodeIfPresent(isFollower, forKey: .isFollower)
        try container.encodeIfPresent(isFollowing, forKey: .isFollowing)
        try container.encodeIfPresent(counters, forKey: .counters)
        
    }
    
}
