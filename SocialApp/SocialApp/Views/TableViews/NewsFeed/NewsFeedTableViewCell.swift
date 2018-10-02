//
//  NewsFeedTableViewCell.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/17/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit
import SafariServices

class NewsFeedTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var newsAvatarImage: UIImageView!
    @IBOutlet weak var firstNameNewsLabel: UILabel!
    @IBOutlet weak var lastNameNewsLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var textNewsLabel: UILabel!
    @IBOutlet weak var attachmentView: UIView!
    var url: URL!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsAvatarImage.image = nil
        firstNameNewsLabel.text = nil
        lastNameNewsLabel.text = nil
        createdLabel.text = nil
        textNewsLabel.text = nil
        attachmentView.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    // MARK: - Function to set gesture in webViewButton
    
    @objc @IBAction func handleTapAction(_ sender: UIButton!) {

        
        if UIApplication.shared.canOpenURL(url) {
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            
        }
        
        
    }
}
