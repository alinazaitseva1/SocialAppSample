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
    
    let counterCollection = UserCounterInfo()
    
}

extension CollectionInfoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return counterCollection.getAmountOfValuesInUserData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = uiCollectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileCounterCollectionViewCell", for: indexPath) as! UserProfileCounterCollectionViewCell
        collectionCell.infoCollectionLabel.text = counterCollection.getValueInlistOFDataInfo(item: indexPath.row)
        collectionCell.nameInfoCollectionLabel.text = counterCollection.getValueInlistOfNamesInfo(item: indexPath.row)
        return collectionCell
    }
}
