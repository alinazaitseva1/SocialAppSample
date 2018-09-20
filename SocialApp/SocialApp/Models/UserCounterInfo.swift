//
//  UserProfileEntity.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/20/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation

class UserCounterInfo {
    
    var listOFDataInfo: [String] {
        return ["5451","2887","725","919","3,712"]
    }
    
    var listOfNamesInfo: [String] {
        return ["friends", "followers", "photos", "tags", "videos"]
    }
    
    func getAmountOfValuesInUserData() -> Int {
        return listOFDataInfo.count
    }
    
    func getValueInlistOFDataInfo(item: Int) -> String {
        return listOFDataInfo[item]
    }
    
    func getValueInlistOfNamesInfo(item: Int) -> String {
        return listOfNamesInfo[item]
    }
    
}
