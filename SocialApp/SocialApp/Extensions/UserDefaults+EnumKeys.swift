//
//  UserDefaults+EnumKeys.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/26/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func setBooleanUserDefaults(flag: Bool, for enumKey: UserDefaultsKeys) {
        
        UserDefaults.standard.set(flag, forKey: enumKey.rawValue)
    }
    
    func setIntUserDefaults(value: Int, for enumKey: UserDefaultsKeys) {
        
        UserDefaults.standard.set(value, forKey: enumKey.rawValue)
    }
    
    func removeCustomUserDefaults(enumKey: UserDefaultsKeys) {
        
        UserDefaults.standard.removeObject(forKey: enumKey.rawValue)
    }
    
}
