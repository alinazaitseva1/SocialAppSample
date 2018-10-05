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
    
    
    static func login(with phone: String, completion: @escaping () -> Void )  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion()
        }
    }
    
    static func validateCodeWith(phone: String, enteredCode: String, completion: @escaping (Bool?) -> Void) {
        completion("4444" == enteredCode)
    }
    
    static func getProfile(by userID: Int? = nil, completion: @escaping (ProfileEntity) -> Void) {
        
        let json = userID == nil ? JSONResponce.myProfileInfo : JSONResponce.userProfileInfo
        
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            let profile = try decoder.decode(ProfileEntity.self, from: Data(data))
            completion(profile)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func getPostsInfo(by userID: Int? = nil, order: OrderBy ,completion: @escaping ([PostEntity]) -> Void) {
        
        let data = JSONResponce.userPostsInfo.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.yyMMdd)
        
        do {
            var posts = try decoder.decode([PostEntity].self, from: Data(data))
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

