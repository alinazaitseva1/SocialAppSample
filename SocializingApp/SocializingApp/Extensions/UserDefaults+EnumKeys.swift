//
//  UserDefaults+EnumKeys.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func set(_ value: Bool, for key: UserDefaultsKeys) {
        self.set(value, forKey: key.rawValue)
    }
    
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
