//
//  DateFormatter+Date.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static let yyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
}
