//
//  ProfileTableViewCell.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class CollectionProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var uiCollectionView: UICollectionView!
    
    var profile: ProfilePage! {
        didSet {
            uiCollectionView.reloadData()
        }
    }
}

extension CollectionProfileTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let _ = profile else { return 0 }
        return Counters.count
    }
    
    func getContent(indexPath: IndexPath) -> (Int, String) {
        let index = indexPath.row
        let profile = self.profile.results.first!
        let profileContent = profile.counters!
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
            assertionFailure("")
            return (index, "")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionCell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as! ProfileCollectionViewCell
        
        let content = getContent(indexPath: indexPath)
        collectionCell.infoCounterLabel.text = content.1
        collectionCell.infoCounterNameLabel.text = String(content.0)
        return collectionCell
    }
}
