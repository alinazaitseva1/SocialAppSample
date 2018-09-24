//
//  CollectionInfoTableViewCell.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/17/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class CollectionInfoTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var uiCollectionView: UICollectionView!
    
    // MARK: - Constants and Variables
    
    var userProfile: UserProfileEntity!
    
}

extension CollectionInfoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Counters.count
    }
    
    func getContent(indexPath: IndexPath) -> (Int, String) {
        let index = indexPath.row
        switch index {
        case 0:
            return (userProfile.counters!.friends, "")
        case 1:
            return (userProfile.counters!.followers, "")
        case 2:
            return (userProfile.counters!.photos, "")
        case 3:
            return (userProfile.counters!.tags, "")
        case 4:
            return (userProfile.counters!.posts, "")
        case 5:
            return (userProfile.counters!.videos, "")
        default:
            break
        }
        return (index, "")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileCounterCollectionViewCell", for: indexPath) as! UserProfileCounterCollectionViewCell
       
        collectionCell.nameInfoCollectionLabel.text = String(userProfile.counters.friends)
        return collectionCell
        
    }
}
