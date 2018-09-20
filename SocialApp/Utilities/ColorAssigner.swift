//
//  ColorPicker.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/13/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

class ColorAssigner {
    
    static func setLook(for textField: UITextField) {
        textField.setupBorderWith(color: CustomColor.grayDefault.color, width: 1)
    }
}
