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
    
    func getContent(indexPath: IndexPath) -> (String, String) {
        let indexI = indexPath.row
        switch indexI {
        case indexI[indexPath]:
            return ("", "")
        default:
            break
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileCounterCollectionViewCell", for: indexPath) as! UserProfileCounterCollectionViewCell
       
        collectionCell.nameInfoCollectionLabel.text = String(userProfile.counters.friends)
        return collectionCell
        
    }
}
