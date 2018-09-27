//
//  UserProfileViewController.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

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

private enum PostsRowType: Int {
    case actionWithPosts
    case newsFeed
    
    init?(indexPath: NSIndexPath) {
        self.init(rawValue: indexPath.row)
    }
    
    static var rows: [PostsRowType] = [.actionWithPosts, .newsFeed]
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
    
    var userPosts: [UserPostsEntity]! {
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
        uiTableView.rowHeight = UITableView.automaticDimension
        ApiRequest.getProfile(by: 12) { userProfile in
            self.userProfile = userProfile
        }
        ApiRequest.getPostsInfo(by: 1) { userPosts in
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
        case .profile:
            return ProfileRowType.rows.count
        case .posts:
            return PostsRowType.rows.count
            
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
                photoCell.mainAvatarImage.loadImageWith(url: userProfile.avatar!, showLoader: true)
                
                photoCell.mainAvatarImage.makeRounded()
                return photoCell
            case .info:
                let infoCell = uiTableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
                infoCell.firstNameLabel.text = userProfile.firstName
                infoCell.lastNameLabel.text = userProfile.lastName
                infoCell.ageLabel.text = String(userProfile.age)
                infoCell.countryLabel.text = userProfile.country
                if userProfile.isOnline{
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
            let row = PostsRowType(indexPath: indexPath as NSIndexPath)!
            switch row {
            case .actionWithPosts:
                let actionsWithPostsCell = uiTableView.dequeueReusableCell(withIdentifier: "ActionWithPostsTableViewCell", for: indexPath) as! ActionWithPostsTableViewCell
                return actionsWithPostsCell
            case .newsFeed:
                let newsFeedCell = uiTableView.dequeueReusableCell(withIdentifier: "NewsFeedTableViewCell", for: indexPath) as! NewsFeedTableViewCell
                newsFeedCell.newsAvatarImage.loadImageWith(url: userProfile.avatar!)
                newsFeedCell.newsAvatarImage.makeRounded()
                newsFeedCell.webViewAttachment.allowsLinkPreview = true
                if let attach = userPosts[indexPath.row].body.attachment, attach.type == .url {
                    let urlAttach = attach.value
                    let request = URLRequest(url: urlAttach!)
                    newsFeedCell.webViewAttachment.loadRequest(request)
                    let webNavigationStoryboard = UIStoryboard(name: "WebNavigation", bundle: nil)
                    let sfSafaryViewController = webNavigationStoryboard.instantiateViewController(withIdentifier: "SFSafaryViewController") as! SFSafaryViewController
                    sfSafaryViewController.exactURL = urlAttach //?????
                }
                return newsFeedCell
            }
        }
    }
}
