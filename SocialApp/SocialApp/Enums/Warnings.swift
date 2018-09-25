//
//  Warnings.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/25/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

enum Warnings {
    
    case notImplemented
    
    var message: String {
        switch self {
            
        case .notImplemented:
            return ("Feature not implemented")
        }
    }
    
}

