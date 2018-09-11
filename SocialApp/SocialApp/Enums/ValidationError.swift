//
//  ValidationError.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

enum ValidationError: Error {
    case dataIsAbsent
    
    var localizedDescription: String {
        switch self {
        case .dataIsAbsent:
            return NSLocalizedString("Required data are not valid", comment: "All fields should be filled in and valid")
        }
    }
}
