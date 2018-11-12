//
//  CollectionInfoTableViewCell.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit
import PKHUD

protocol NewsFeedTableViewCellDelegate: class {
    func switchToUser(_ id: Int)
}

class NewsFeedTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var feedAvatarImage: UIImageView!
    @IBOutlet weak var firstNameNewsLabel: UILabel!
    @IBOutlet weak var lastNameNewsLabel: UILabel!
    @IBOutlet weak var createdNewsLabel: UILabel!
    @IBOutlet weak var textNewsLabel: UILabel!
    @IBOutlet weak var attachmentView: UIView!
    
    // MARK: - Vars
    
    var url: URL!
    var delegate: NewsFeedTableViewCellDelegate?
    //var post: PostEntity!
    var authorId: Int!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        feedAvatarImage.image = nil
        firstNameNewsLabel.text = nil
        lastNameNewsLabel.text = nil
        createdNewsLabel.text = nil
        textNewsLabel.text = nil
        attachmentView.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    // MARK: - Actions
    
    @IBAction func pushSwitchToUserButton(_ sender: UIButton) {
        //delegate?.switchToUser(post.author.id)
        delegate?.switchToUser(authorId)
    }
    
    /// - Function to set gesture
    @objc func handleTapAction(_ sender: UIButton) {
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
