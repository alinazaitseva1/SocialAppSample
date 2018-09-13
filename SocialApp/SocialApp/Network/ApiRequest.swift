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
    
    static func captureResponse(for telephone: String, completion: @escaping (String?) -> Void ) {
        completion(loginResponse["code"]!)
    }
}
