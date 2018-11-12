//
//  ProfileTableViewCell.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/16/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var statusOnlineLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var writeMessageView: UIView!
    
    // MARK: - Actions
    
    @IBAction func pushWriteMessageButton(_ sender: UIButton) {
        parentViewController?.showAlert(message: Warnings.notImplemented.message)
    }
    @IBAction func pushAddFriendButton(_ sender: UIButton) {
        parentViewController?.showAlert(message: Warnings.notImplemented.message)
    }
}
