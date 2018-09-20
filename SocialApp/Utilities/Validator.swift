//
//  Validator.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/13/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

class Validator {
    
    static func symbolsValidateOnlyNumbers(_ string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
