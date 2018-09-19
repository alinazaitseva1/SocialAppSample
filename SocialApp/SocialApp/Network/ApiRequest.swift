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
}
