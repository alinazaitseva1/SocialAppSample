//
//  ApiRequest.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class ApiRequest {
    static var response = ["status" : "200",
                           "code" : "4444"]
    
    static func getResponse(for telephone: String, completion: @escaping (String?) -> Void ) {
        completion(response["key"])
    }
}
