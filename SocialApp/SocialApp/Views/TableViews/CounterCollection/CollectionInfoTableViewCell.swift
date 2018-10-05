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
    
    var userProfile: ProfileEntity! {
        didSet{
            uiCollectionView.reloadData()
        }
    }
    
}

extension CollectionInfoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let _ = userProfile else { return 0 }
        return Counters.count
    }
    
    func getContent(indexPath: IndexPath) -> (Int, String) {
        let index = indexPath.row
        let profileContent = userProfile.counters!
        switch index {
        case 0:
            return (profileContent.friends, "friends")
        case 1:
            return (profileContent.followers, "folowers")
        case 2:
            return (profileContent.photos, "photos")
        case 3:
            return (profileContent.tags, "tags")
        case 4:
            return (profileContent.posts, "posts")
        case 5:
            return (profileContent.videos, "videos")
        default:
            break
        }
        return (index, "")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileCounterCollectionViewCell", for: indexPath) as! UserProfileCounterCollectionViewCell
        
        let content = getContent(indexPath: indexPath)
        collectionCell.infoCollectionLabel.text = content.1
        collectionCell.nameInfoCollectionLabel.text = String(content.0)
        return collectionCell
        
    }
}
