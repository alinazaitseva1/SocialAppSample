//
//  UIView+Image.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/13/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func makeRounded() {
        // Forced photo accept round shape
        layer.borderWidth = 1.0
        layer.masksToBounds = false
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
}
