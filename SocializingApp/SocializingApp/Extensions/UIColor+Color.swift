//
//  UIColor+Color.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/9/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alpha: Int = 0xFF) {
        self.init(
            red:   CGFloat(red)   / 255.0,
            green: CGFloat(green) / 255.0,
            blue:  CGFloat(blue)  / 255.0,
            alpha: CGFloat(alpha) / 255.0
        )
    }
}
