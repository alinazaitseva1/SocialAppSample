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

    @IBOutlet weak var mainAvatar: UIImageView!
    @IBOutlet weak var newsAvatar: UIImageView!
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        mainAvatar.setRounded()
        newsAvatar.setRounded()
        
    }
    
}
