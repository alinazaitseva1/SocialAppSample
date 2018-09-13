//
//  ColorPicker.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/13/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

class ColorPicker {
    
    static func setBorderColor(for textField: UITextField) {
        textField.setDefaultLookWith(color: CustomColor.grayDefault.color, border: 1)
    }
    
    
}
