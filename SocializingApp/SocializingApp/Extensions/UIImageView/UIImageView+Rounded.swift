//
//  UIImageView+Rounded.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func makeRounded() {
        // Make photo's round shape
        layer.borderWidth = 1.0
        layer.masksToBounds = false
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
}
