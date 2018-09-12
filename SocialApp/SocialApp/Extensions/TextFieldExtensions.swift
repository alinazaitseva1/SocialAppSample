//
//  TextFieldExtensions.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setAppropriateLookWith (color: UIColor, border: Int) {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = color.cgColor
    }
}
