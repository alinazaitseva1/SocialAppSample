//
//  CustomFont.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/12/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

enum CustomFont: String {
    case DINCondensed = "DINCondensed-Bold"
    
    func with(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}

