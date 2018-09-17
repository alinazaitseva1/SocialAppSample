//
//  UserSection.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/17/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

enum SectionType: Int {
    case Profile
    case Posts
    
    init?(indexPath: NSIndexPath) {
        self.init(rawValue: indexPath.section)
    }
    
    static var numberOfSections: Int {
        var count = 0
        while let _ = SectionType(rawValue: count) {
            count += 1
        }
        return count
    }
}

enum Profile: Int {
    case Photo
    case Info
    case Actions
    case CollectionInfo
}

enum Posts: Int {
    case ActionWithPosts
    case NewsFeed
}
