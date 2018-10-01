//
//  DateFormatter+String.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/28/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    
    var stringPresentation: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}
