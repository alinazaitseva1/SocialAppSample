//
//  CustomColor.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/12/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

enum CustomColor {
    
    case grayDefault
    case redError
    
    var color: UIColor {
        switch self {
            
        case .grayDefault: return UIColor(red: 242.0, green: 243.0, blue: 244, alpha: 1.0)
        case .redError:    return UIColor(red: 250.0, green: 99.0, blue: 0.0, alpha: 1.0)
            
        }
    }
    
}
