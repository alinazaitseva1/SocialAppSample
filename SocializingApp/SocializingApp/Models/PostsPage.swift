//
//  Post.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/9/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

struct PostsPage: Codable {
    
    // MARK: - Vars
    
    var count      : Int?
    var prev       : String?
    var next       : String?
    var results    : [PostEntity]!
}

struct PostEntity: Codable {
    
    var id         : Int!
    
    var author     : PostAuthor!
    var created    : Date!
    var body       : PostBody!
    
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
    }
    
    struct PostBody: Codable {
        var text       : String!
        var attachment : PostAttachment?
    }
    
    struct PostAttachment: Codable {
        var type  : PostType!
        var value : String!
    }
    
    enum PostType: String, Codable {
        case photo
        case url
        case video
    }
}
