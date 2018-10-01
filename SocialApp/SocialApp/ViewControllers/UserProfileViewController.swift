//
//  UserProfileViewController.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit
import SafariServices

private enum SectionType: Int {
    case profile
    case posts
    
    init?(indexPath: NSIndexPath) {
        self.init(rawValue: indexPath.section)
    }
    static var section: [SectionType] = [.profile, .posts]
}

private enum ProfileRowType: Int {
    case photo
    case info
    case actions
    case collectionInfo
    
    init?(indexPath: NSIndexPath) {
        self.init(rawValue: indexPath.row)
    }
    
    static var rows: [ProfileRowType] = [.photo, .info, .actions, .collectionInfo]
}

class UserProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var uiTableView: UITableView!
    
    // MARK: - Constants and Variables
    
    var userProfile: UserProfileEntity! {
        didSet{
            uiTableView.reloadData()
        }
    }
    
    var userPosts: [UserPostEntity]! {
        didSet{
            uiTableView.reloadData()
        }
    }
    
    //MARK: - Actions
    
    @IBAction func pushLogoutButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
        UserDefaults.standard.removeCustomUserDefaults(enumKey: .token)
    }
    
    @IBAction func pushWriteMessage(_ sender: UIButton) {
        self.showAlert(title: "Achtung", message: Warnings.notImplemented.message)
    }
    
    @IBAction func pushAddFriendsButton(_ sender: UIButton) {
        self.showAlert(title: "Achtung", message: Warnings.notImplemented.message)
    }
    
    // MARK: - Initialization functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsFeedTableViewCell")
        ApiRequest.getProfile(by: 12) { userProfile in
            self.userProfile = userProfile
        }
        ApiRequest.getPostsInfo(order: .descending) { userPosts in
            self.userPosts = userPosts
        }
    }
}
extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let section = SectionType(rawValue: section)!
        
        switch section {
        case .profile : return ProfileRowType.rows.count
        case .posts   : return userPosts?.count ?? 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // TODO: AZ - add switch
        return section == 0 ? 0 : 32
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let section = SectionType(rawValue: section)!
        
        switch section {
        case .profile:
            return nil
        case .posts:
            let actionsHeaderCell = uiTableView.dequeueReusableCell(withIdentifier: "ActionWithPostsTableViewCell") as! ActionWithPostsTableViewCell
            return actionsHeaderCell.contentView
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = SectionType(indexPath: indexPath as NSIndexPath)!
        
        switch section {
        case .profile:
            let row = ProfileRowType(indexPath: indexPath as NSIndexPath)!
            switch row {
            case .photo:
                let photoCell = uiTableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as! PhotoTableViewCell
                photoCell.mainAvatarImage.loadImageWith(url: userProfile.avatar!, showLoader: true) // TODO: - check for nil if - let
                
                photoCell.mainAvatarImage.makeRounded()
                return photoCell
                
            case .info:
                
                let infoCell = uiTableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
                infoCell.firstNameLabel.text = userProfile.firstName
                infoCell.lastNameLabel.text = userProfile.lastName
                infoCell.ageLabel.text = String(userProfile.age)
                infoCell.countryLabel.text = userProfile.country
                
                if userProfile.isOnline {
                    infoCell.userStateLabel.text = "Online"
                } else {
                    infoCell.userStateLabel.text = "Offline"
                }
                return infoCell
                
            case .actions:
                
                let actionsCell = uiTableView.dequeueReusableCell(withIdentifier: "ActionsTableViewCell", for: indexPath) as! ActionsTableViewCell
                return actionsCell
                
            case .collectionInfo:
                
                let collectionInfoCell = uiTableView.dequeueReusableCell(withIdentifier: "CollectionInfoTableViewCell", for: indexPath) as! CollectionInfoTableViewCell
                collectionInfoCell.userProfile = userProfile
                return collectionInfoCell
            }
        case .posts:
            
            let newsFeedCell = uiTableView.dequeueReusableCell(withIdentifier: "NewsFeedTableViewCell", for: indexPath) as! NewsFeedTableViewCell
            newsFeedCell.newsAvatarImage.loadImageWith(url: userProfile.avatar!) // TODO: AZ - Check for nil
            newsFeedCell.newsAvatarImage.makeRounded()
            
            // Constants
            
            let post = userPosts[indexPath.row]
            let attachentView = newsFeedCell.attachmentView!
            
            if let attach = post.body.attachment,
                let type = attach.type {
                
                switch type {
                    
                case .photo:
                    
                    let imageView = UIImageView.init()
                    imageView.loadImageWith(url: (attach.value)!)
                    attachentView.addSubview(imageView)
                    imageView.setUpConstraint(with: attachentView)
                    
                case .url:
                    
                    let request = URLRequest(url: attach.value!)
                    let webView = UIWebView.init()
                    webView.scalesPageToFit = true
                    webView.paginationMode = .leftToRight
                    webView.loadRequest(request)
                    attachentView.addSubview(webView)
                    webView.setUpConstraint(with: attachentView)
                }
            }
            newsFeedCell.createdLabel.text = post.created.stringPresentation
            newsFeedCell.firstNameNewsLabel.text = post.author.firstName
            newsFeedCell.lastNameNewsLabel.text = post.author.lastName
            newsFeedCell.textNewsLabel.text = post.body.text
            
            return newsFeedCell
        }
    }
}
