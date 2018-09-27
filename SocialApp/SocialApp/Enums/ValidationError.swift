//
//  ValidationError.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

enum ValidationError: Error, LocalizedError {
    case invalidData
    case codeInvalid
    case pageNotExist
    
    var errorDescription: String? {
        switch self {
            
        case .invalidData:
            return "Telephone number invalid"
            
        case .codeInvalid:
            return "Invalid code"
            
        case .pageNotExist:
            return "Pade does not exist"
            
        }
    }
}
