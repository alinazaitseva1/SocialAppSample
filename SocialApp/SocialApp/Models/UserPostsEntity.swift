//
//  UserPostsEntity.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/26/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

struct UserPostsEntity: Codable {
    
    // MARK: - Variables
    
    var id         : Int!
    
    var author     : [PostAuthor]!
    var created    : Date!
    var body       : [PostBody]!
    
    struct PostAuthor: Codable {
        
        var id         : Int!
        var avatar     : URL?
        var firstName  : String!
        var lastName   : String!
        var userName   : String?
        
        // MARK: - Custom vars
        
        var getFullName: String {
            return "\(firstName!) \(lastName!)"
        }
        
        private enum CodingKeys: String, CodingKey {
            
            case id
            
            case avatar
            case firstName = "first_name"
            case lastName = "last_name"
            case userName = "username"
        }
        
    }
    
    struct PostBody: Codable {
        var text       : String!
        var attachment : [PostAttachment]?
    }
    
    struct PostAttachment: Codable {
        var type  : PostType!
        var value : URL!
    }
    
    enum PostType: String, Codable {
        case photo
        case url
    }
}
