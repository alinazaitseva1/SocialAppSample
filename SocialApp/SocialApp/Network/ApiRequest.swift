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
    static let postsInfo = """
    [
      {
        "id": 3,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-25T12:45:12",
        "body": {
          "text": "First post",
          "attachment": null
        }
      },
      {
        "id": 2,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-21T12:45:12",
        "body": {
          "text": "Second post",
          "attachment": {
            "type": "url",
            "value": "https://www.google.com.ua/"
          }
        }
      },
      {
        "id": 1,
        "author": {
          "id": 12,
          "avatar": "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Oxygen480-emotes-face-smile-big.svg/2000px-Oxygen480-emotes-face-smile-big.svg.png",
          "first_name": "John",
          "last_name": "Smith",
          "username": null
        },
        "created": "2018-09-14T12:45:12",
        "body": {
          "text": "Third post",
          "attachment": {
            "type": "photo",
            "value": "https://leader.pubs.asha.org/data/Journals/ASHANL/934378/NIB1_web.png"
          }
        }
      }
    ]
    """
    
    static func login(with phone: String, completion: @escaping () -> Void )  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion()
        }
    }
    
    static func validateCodeWith(phone: String, enteredCode: String, completion: @escaping (Bool?) -> Void) {
        completion("4444" == enteredCode)
    }
    
    static func getProfile(by userID: Int, completion: @escaping (UserProfileEntity) -> Void) {
        let data = profileInfo.data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            let profile = try decoder.decode(UserProfileEntity.self, from: Data(data))
            completion(profile)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func getPostsInfo(order: OrderBy ,completion: @escaping ([UserPostEntity]) -> Void) {
        let data = postsInfo.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.yyMMdd)

        do {
            var posts = try decoder.decode([UserPostEntity].self, from: Data(data))
            posts.sort { (lhs, rhs) -> Bool in
                
                switch order {
                case .ascending:
                    return lhs.id < rhs.id
                case .descending:
                    return lhs.id > rhs.id
                }
            }
            completion(posts)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

