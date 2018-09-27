//
//  DateFormatter+Date.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/27/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let yyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
}
