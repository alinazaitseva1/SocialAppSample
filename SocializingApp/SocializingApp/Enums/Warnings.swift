//
//  Warnings.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/9/18.
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

