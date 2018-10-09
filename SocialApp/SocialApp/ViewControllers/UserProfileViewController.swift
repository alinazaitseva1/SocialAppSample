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

class UserProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var uiTableView: UITableView!
    @IBOutlet weak var switchUserButton: UIButton!
    
    // MARK: - Variables
    
    var userProfile: ProfileEntity! {
        didSet{
            uiTableView.reloadData()
        }
    }
    
    var userPosts: [PaginatedPost]! {
        didSet{
            uiTableView.reloadData()
        }
    }
    
    var userId: Int?
    
    //MARK: - Actions
    
    @IBAction func pushLogoutButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
        UserDefaults.standard.removeCustomUserDefaults(enumKey: .token)
    }
    
    @IBAction func pushSwitchUserButton(_ sender: UIButton) {
        
        let userProfileStoryboard = UIStoryboard(name: "UserProfile", bundle: nil)
        let userProfileVC = userProfileStoryboard.instantiateViewController(withIdentifier: "UserProfileViewController") as!  UserProfileViewController
        userProfileVC.userId = 12
        self.navigationController?.pushViewController(userProfileVC, animated: true)
    }
    
    // MARK: - Initialization functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiTableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsFeedTableViewCell")
        
        let nib = UINib(nibName: "CustomSectionHeader", bundle: nil)
        uiTableView.register(nib, forHeaderFooterViewReuseIdentifier: "CustomSectionHeader")
        
        ApiRequest.getProfile(by: userId) { userProfile in
            self.userProfile = userProfile
        }
    
        ApiRequest.getPostsInfo(by: userId, order: .descending) { userPosts in
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
        
        let section = SectionType(rawValue: section)!
        
        switch section {
            
        case .profile: return 0
        case .posts:
            return 55
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let section = SectionType(rawValue: section)!
        
        switch section {
            
        case .profile: return nil
            
        case .posts:
            
            let actionsHeaderCell = uiTableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomSectionHeader") as! CustomSectionHeader
            return actionsHeaderCell
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
                if let userAvatar = userProfile.avatar {
                    photoCell.mainAvatarImage.loadImageWith(url: userAvatar, showLoader: true)
                }
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
            
            if let userAvatar  =  userProfile.avatar {
                newsFeedCell.newsAvatarImage.loadImageWith(url: userAvatar)
                newsFeedCell.newsAvatarImage.makeRounded()
            }
            
            // Constants cell
            
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
                    imageView.contentMode = .scaleAspectFit
                    
                case .url :
                    
                    let url = attach.value!
                    
                    let webView = UIWebView.init()
                    webView.scalesPageToFit = true
                    webView.paginationMode = .topToBottom
                    webView.isUserInteractionEnabled = false
                    
                    webView.loadRequest(URLRequest(url: url))
                    
                    attachentView.addSubview(webView)
                    webView.setUpConstraint(with: attachentView)
                    
                    let webViewButton = UIButton.init()
                    attachentView.addSubview(webViewButton)
                    webViewButton.setUpConstraint(with: attachentView)
                    
                    // Gesture to custom webViewButton
                    webViewButton.addTarget(newsFeedCell, action: #selector(NewsFeedTableViewCell.handleTapAction(_:)), for: .touchUpInside)
                    
                    newsFeedCell.url = url
                    
                case .video: // TODO: - AZ: unit in one multiple switch case
                    
                    let url = attach.value!
                    let stringUrl = url.absoluteString
                    
                    let videoView = UIWebView.init()
                    videoView.scalesPageToFit = true
                    videoView.paginationMode = .topToBottom
                    videoView.isUserInteractionEnabled = false
                    
                    let youtubeURL = URL(string: "https://www.youtube.com/embed/\(stringUrl)")
                    videoView.loadRequest(URLRequest(url: youtubeURL!))
                    
                    attachentView.addSubview(videoView)
                    videoView.setUpConstraint(with: attachentView)
                    
                    let videoViewButton = UIButton.init()
                    attachentView.addSubview(videoViewButton)
                    videoViewButton.setUpConstraint(with: attachentView)
                    
                    videoViewButton.addTarget(newsFeedCell, action: #selector(NewsFeedTableViewCell.handleTapAction(_:)), for: .touchUpInside)
                    
                    newsFeedCell.url = youtubeURL
                }
            }
            
            newsFeedCell.createdLabel.text = post.created.stringPresentation
            newsFeedCell.firstNameNewsLabel.text = post.author.firstName
            newsFeedCell.lastNameNewsLabel.text = post.author.lastName
            newsFeedCell.textNewsLabel.text = post.body.text
            
            return newsFeedCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let section = SectionType(indexPath: indexPath as NSIndexPath)!
        
        switch section {
        case .profile:
            let row = ProfileRowType(indexPath: indexPath as NSIndexPath)!
            switch row {
            case .actions:
                if userProfile.isMine == false {
                    return 0
                } else {
                    return 45
                }
            default: break
            }
        default: break
        }
        return UITableView.automaticDimension
    }
    
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell , forRowAtIndexPath indexPath: NSIndexPath) {
//
//    }
    
}
