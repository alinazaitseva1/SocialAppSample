//
//  ValidationError.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

enum ValidationError: Error {
    case invalidData
    case codeInvalid
}

extension ValidationError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .invalidData:
            return NSLocalizedString("Telephone number invalid", comment: "Required field should be filled in and valid")
        case .codeInvalid:
            return NSLocalizedString("Invalid code", comment: "Code should be valid and fields filled in")
        }
    }
}
