//
//  CustomColor.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/9/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

enum CustomColor {
    
    case grayDefault
    case lightGreenState
    case disabledBlueColor
    case lavander
    case powderblue
    case darkslateblue
    case darkcyan
    case mediumaquamarine
    case palegoldenrod
    
    var color: UIColor {
        switch self {
            
        case .grayDefault:       return UIColor(red: 242, green: 243, blue: 244)
        case .lightGreenState:       return UIColor(red: 216, green: 222, blue: 202)
        case .disabledBlueColor: return UIColor(red: 240, green: 248, blue: 255)
        case .lavander:          return UIColor(red: 230, green: 230, blue: 250)
        case .powderblue:        return UIColor(red: 176, green: 224, blue: 230)
        case .darkslateblue:     return UIColor(red: 72, green: 61, blue: 139)
        case .darkcyan:          return UIColor(red: 0, green: 139, blue: 139)
        case .mediumaquamarine:  return UIColor(red: 102, green: 205, blue: 170)
        case .palegoldenrod:     return UIColor(red: 238, green: 232, blue: 170)
            
        }
    }
}
