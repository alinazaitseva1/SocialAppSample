//
//  ApiRequest.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class ApiCall {
    
    private static let amountPostInPage = 5
    
    static func login(with phone: String, completion: @escaping () -> Void ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion()
        }
    }
    
    static func loginConfirm(with phone: String, code: String, completion: @escaping (Bool) -> Void ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(true)
        }
    }
    
    static func validateCodeWith(phone: String, enteredCode: String, completion: @escaping(Bool?) -> Void) {
        completion("4444" == enteredCode)
    }
    
    static func getProfile(by userId: Int? = nil, completion: @escaping(ProfilePage) -> Void) {
        //DispatchQueue.global().async {
            let json = userId == nil ? JSONResponce.myProfileInfo : JSONResponce.usersProfileInfo
            
            let data = json.data(using: .utf8)!
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                var profile = try decoder.decode(ProfilePage.self, from: Data(data))
                //sleep(3)
                if let userId = userId {
                    profile.results = profile.results.filter({ $0.id == userId })
//                    completion(profile.results.first(where: { $0.id == userId }))
                }
                completion(profile)
            }
            catch {
                print(error.localizedDescription)
            }
        //}
    }
    
    static func getFeedPosts(ofSet: Int? = 0, order: OrderBy, authorId: Int? = nil, completion: @escaping(PostsPage) -> Void) {
        //DispatchQueue.global().async {
            
            let json = JSONResponce.allPostsInfo
            
            let data = json.data(using: .utf8)!
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.yyMMdd)
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                var posts = try decoder.decode(PostsPage.self, from: Data(data))
                if authorId != nil {
                    posts.results = posts.results.filter({ post -> Bool in
                        post.author.id == authorId
                    })
                }
                posts.results.sort { (lhs, rhs) -> Bool in
                    switch order {
                    case .ascending:
                        return lhs.id < rhs.id
                    case .descending:
                        return lhs.id > rhs.id
                    }
                }
                
                var subsetArray = [PostEntity]()
                var next = ofSet ?? 0 + amountPostInPage
                
                if next > posts.results.count - 1 {
                    next = posts.results.count - 1
                }
                for i in 0...next {
                    subsetArray.append(posts.results[i])
                }
                
                if posts.results.last?.id == subsetArray.last?.id {
                    posts.next = nil
                }
                
                posts.results = subsetArray
                
                //sleep(3)
                completion(posts)
            } catch {
                print(error.localizedDescription)
            }
        }
    //}
}
