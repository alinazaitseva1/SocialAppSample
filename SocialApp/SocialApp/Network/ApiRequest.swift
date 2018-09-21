//
//  ApiRequest.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class ApiRequest {
    
    static private var users: [String: String] = [:]
    static private var profileInfo = """
    {
        "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null,
          "age": 32,
          "location": {
            "country": "USA",
            "address": "7-th lane 46"
          },
          "is_online": true,
          "counters": {
            "friends": 100,
            "followers": 1356,
            "tags": 125,
            "posts": 18,
            "photos": 189,
            "videos": 2
          },
          "connection_type": "friends",
          "is_follower": false,
          "is_following": true
    }
"""
    
    static func login(with phone: String) -> Bool {
        if users[phone] == nil {
            users[phone] = "4444" // TODO: Generate random code
            return false
        } else {
            return true
        }
    }
    
    static func validateCode(phone: String, enteredCode: String, completion: @escaping (Bool?) -> Void) {
        completion(users[phone] == enteredCode)
    }
    
    
    static func getProfile(by userID: Int, completion: @escaping (UserProfileEntity) -> Void) {
        
        let data = profileInfo.data(using: .utf8)!
        let decoder = JSONDecoder()
        let profile = try! decoder.decode(UserProfileEntity.self, from: Data(data))
        completion(profile)
    }
    
}
