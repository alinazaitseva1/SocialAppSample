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
    case disabledGrayColor
    
    var color: UIColor {
        switch self {
            
        case .grayDefault:       return UIColor(red: 242, green: 243, blue: 244)
        case .redError:          return UIColor(red: 250, green: 99, blue: 0)
        case .disabledGrayColor: return UIColor(red: 225, green: 225, blue: 225)
            
        }
    }
    
}
