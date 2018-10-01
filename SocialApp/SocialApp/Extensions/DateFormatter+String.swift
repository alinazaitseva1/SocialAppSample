//
//  DateFormatter+String.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/28/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

extension Formatter {
    static let date = DateFormatter()
}

extension Date {
    var stringFormmater: String {
        Formatter.date.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return Formatter.date.string(from: self)
    }
}
