//
//  ActionsTableViewCell.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/17/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class ActionsTableViewCell: UITableViewCell {
   
    // MARK: - Actions
    
    @IBAction func pushWriteMessage(_ sender: UIButton) {
        parentViewController?.showAlert(title: "Achtung", message: Warnings.notImplemented.message)
        
    }
    
    @IBAction func pushAddFriendsButton(_ sender: UIButton) {
        parentViewController?.showAlert(title: "Achtung", message: Warnings.notImplemented.message)
    }
    
}
