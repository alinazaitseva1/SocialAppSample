//
//  UserProfileViewController.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var writeMessageLabel: UILabel!
    @IBOutlet weak var addToFriends: UILabel!
    @IBOutlet weak var mainAvatar: UIImageView!
    @IBOutlet weak var newsAvatar: UIImageView!

    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        mainAvatar.setRounded()
        newsAvatar.setRounded()
        writeMessageLabel.layer.borderColor = UIColor.white.cgColor
        writeMessageLabel.layer.borderWidth = 1
        writeMessageLabel.layer.cornerRadius = 5 // TODO: - Fix replacement of text via borders
        // FIXME: - Make a 4's devices layout
    }
    
}
