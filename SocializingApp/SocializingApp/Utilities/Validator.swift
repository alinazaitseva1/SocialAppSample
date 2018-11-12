//
//  Validator.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/10/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

class Validator {
    
    static func symbolsValidateOnlyNumbers(_ string: String) -> Bool {
        let allowedCharacters = CharacterSet.init(charactersIn: "+0123456789")// decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
