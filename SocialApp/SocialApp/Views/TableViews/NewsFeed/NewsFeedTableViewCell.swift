//
//  NewsFeedTableViewCell.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/17/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var newsAvatarImage: UIImageView!
    @IBOutlet weak var firstNameNewsLabel: UILabel!
    @IBOutlet weak var lastNameNewsLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var textNewsLabel: UILabel!
    @IBOutlet weak var attachmentView: UIView!
}
