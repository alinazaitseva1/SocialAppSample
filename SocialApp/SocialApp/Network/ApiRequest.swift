//
//  ApiRequest.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class ApiRequest {
    static var loginResponse = ["status" : "200",
                           "code" : "4444"]
    
    static func login(for telephone: String, completion: @escaping (String?) -> Void ) {
        completion(loginResponse["code"]!) // TODO: Rework
    }
    
    static func validCode(phone: String, enteredCode: String, completion: @escaping (Bool?) -> Void) {
        completion(true) // TODO: In Use
    }
}
