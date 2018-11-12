//
//  ProfileViewController.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/9/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import PKHUD

private enum SectionType: Int, CaseIterable {
    
    case profile
    case posts
    
    init?(indexPath: IndexPath) {
        self.init(rawValue: indexPath.section)
    }
}

private enum ProfileRowType: Int, CaseIterable {
    
    case profileInfo
    case collectionInfo
    
    init?(indexPath: NSIndexPath) {
        self.init(rawValue: indexPath.row)
    }
}

class ProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var uiTableView: UITableView!
    
    // MARK: - Vars
    
    var profile: ProfilePage!
    
    //var profilePage: Profile!
    
    var posts: PostsPage! {
        didSet{
            uiTableView.reloadData()
        }
    }
    
    var userId: Int?
    private var filter: FilterBy = .all
    private var order: OrderBy = .ascending
    
    // MARK: - Actions
    
    @IBAction func pushLogoutButton(_ sender: ChangeStateButton) {
        HUD.show(.progress)
        self.navigationController?.popToRootViewController(animated: true)
        UserDefaults.standard.removeCustomUserDefaults(enumKey: .token)
        HUD.hide()
    }
    
    // MARK: - Init functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNib()
        receiveData()
        
        if profile.results.first?.isMine == true {
            self.navigationItem.setHidesBackButton(true, animated:true)
        }
    }
    
    // MARK: - Functions
    
    /// Register nib to cell
    private func registerNib() {
        
        uiTableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsFeedTableViewCell")
        
        let newsNib = UINib(nibName: "NewsFeedSectionCustomHeader", bundle: nil)
        uiTableView.register(newsNib, forHeaderFooterViewReuseIdentifier: "NewsFeedSectionCustomHeader")
    }
    
    /// Request data from network
    private func receiveData() {
        let downloadGroup = DispatchGroup()
        HUD.show(.progress)
        
        downloadGroup.enter()
        ApiCall.getProfile(by: userId) { userProfile in
            self.profile = userProfile
            downloadGroup.leave()
        }
        
        downloadGroup.enter()
        ApiCall.getFeedPosts(order: .ascending, authorId: userId) { userPosts in
            self.posts = userPosts
            downloadGroup.leave()
        }
        
        downloadGroup.notify(queue: .main) {
            HUD.hide()
            self.uiTableView.reloadData()
        }
    }
    
    /// - Action Sheet to order posts
    private func showOrderByActionSheet(title: String? = nil, message: String? = nil ) {
        let alertOrder = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .actionSheet)
        let orderNewAction = UIAlertAction(title: "Order: new first",
                                           style: .default) { (action) in
                                            self.order = .ascending
                                            ApiCall.getFeedPosts(order: .ascending) { userPosts in
                                                self.posts = userPosts
                                            }
                                            
        }
        
        let orderOldAction = UIAlertAction(title: "Order: old first",
                                           style: .default) { (action) in
                                            self.order = .descending
                                            ApiCall.getFeedPosts(order: .descending) { userPosts in
                                                self.posts = userPosts
                                            }
                                            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel) { (action) in
        }
        alertOrder.addAction(orderNewAction)
        alertOrder.addAction(cancelAction)
        alertOrder.addAction(orderOldAction)
        
        present(alertOrder, animated: true, completion: nil)
    }
    
    /// - Action Sheet to filter posts
    private func showFilterFeedActionSheet(title: String? = nil, message: String? = nil ) {
        let alertFilter = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .actionSheet)
        let filterAllAction = UIAlertAction(title: "Filter: all",
                                            style: .default) { (action) in
                                                self.filter = .all
                                                ApiCall.getFeedPosts(order: .ascending) { userPosts in
                                                    self.posts = userPosts
                                                }
                                                
        }
        let filterMineAction = UIAlertAction(title: "Filter: mine",
                                             style: .default) { (action) in
                                                self.filter = .mine
                                                ApiCall.getFeedPosts(order: .ascending, authorId: 13) { userPosts in
                                                    self.posts = userPosts // 13 - userId JSON var
                                                }
        }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel) { (action) in
        }
        alertFilter.addAction(filterAllAction)
        alertFilter.addAction(cancelAction)
        alertFilter.addAction(filterMineAction)
        
        present(alertFilter, animated: true, completion: nil)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return SectionType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let posts = posts else { return 0 }
        
        let section = SectionType(rawValue: section)!
        
        switch section {
            
        case .profile:
            return ProfileRowType.allCases.count
        case .posts:
            return posts.results.count
        }
    }
    
    ///Function to load next page from ApiCall
    private func loadNextPage(_ indexPath: IndexPath) {
        DispatchQueue.main.async() {
            ApiCall.getFeedPosts(ofSet: indexPath.row, order: .descending, completion: { userPosts in
                self.posts.next = userPosts.next
                
                userPosts.results.forEach({ (posts) in
                    self.posts.results.append(posts)
                })
            })
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = SectionType(indexPath: indexPath)!
        let profile = self.profile.results.first!
        
        switch section {
            
        case .profile:
            
            let row = ProfileRowType(indexPath: indexPath as NSIndexPath)!
            
            switch row {
                
            case .profileInfo:
                
                let profileCell = uiTableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
                
                if let profileAvatar = profile.avatar {
                    profileCell.profileImage.sd_setIndicatorStyle(.whiteLarge)
                    profileCell.profileImage.sd_setShowActivityIndicatorView(true)
                    profileCell.profileImage.sd_setImage(with: profileAvatar)
                }
                
                profileCell.profileImage.makeRounded()
                
                profileCell.firstNameLabel.text = profile.firstName
                profileCell.lastNameLabel.text  = profile.lastName
                profileCell.ageLabel.text       = String(profile.age)
                profileCell.countryLabel.text   = profile.location.country
                
                if profile.isOnline {
                    profileCell.statusOnlineLabel.text = "Online"
                } else {
                    profileCell.statusOnlineLabel.text = "Offline"
                }
                
                // checking which profile on the screen
                
                if profile.isMine == true {
                    profileCell.writeMessageView.isHidden = true
                } else {
                    profileCell.writeMessageView.isHidden = false
                }
                
                return profileCell
                
            case .collectionInfo:
                
                let collectionProfileCell = uiTableView.dequeueReusableCell(withIdentifier: "CollectionProfileTableViewCell", for: indexPath) as! CollectionProfileTableViewCell
                collectionProfileCell.profile = self.profile // data source to provide profile info
                return collectionProfileCell
            }
            
        case .posts:
            
            let newsFeedCell = uiTableView.dequeueReusableCell(withIdentifier: "NewsFeedTableViewCell", for: indexPath) as! NewsFeedTableViewCell
            
            let post = posts.results[indexPath.row]
            let attachView = newsFeedCell.attachmentView!
            
            if let attach = post.body.attachment,
                let type = attach.type {
                
                switch type {
                    
                case .photo:
                    
                    let imageView = UIImageView.init()
                    imageView.setImageUsingUrl(attach.value)
                    attachView.addSubview(imageView)
                    imageView.setUpConstraint(with: attachView)
                    imageView.contentMode = .scaleAspectFit
                    
                case .url:
                    
                    let stringUrl = attach.value!
                    let url = URL(string: stringUrl)
                    let webView = UIWebView.init()
                    webView.scalesPageToFit = true
                    webView.paginationMode = .topToBottom
                    webView.isUserInteractionEnabled = false
                    webView.loadRequest(URLRequest(url: url!))
                    
                    attachView.addSubview(webView)
                    webView.setUpConstraint(with: attachView)
                    
                    let webViewButton = UIButton.init()
                    attachView.addSubview(webViewButton)
                    webViewButton.setUpConstraint(with: attachView)
                    
                    // Gesture to custom webViewButton
                    webViewButton.addTarget(newsFeedCell, action: #selector(NewsFeedTableViewCell.handleTapAction(_:)), for: .touchUpInside) // handle tap?
                    
                    newsFeedCell.url = url  // url delegate to cell
                    
                case .video:
                    
                    let url = attach.value!
                    
                    let videoView = UIWebView.init()
                    videoView.scalesPageToFit = true
                    videoView.paginationMode = .topToBottom
                    videoView.isUserInteractionEnabled = false
                    
                    let youtubeURL = URL(string: "https://www.youtube.com/embed/\(url)")
                    videoView.loadRequest(URLRequest(url: youtubeURL!))
                    
                    attachView.addSubview(videoView)
                    videoView.setUpConstraint(with: attachView)
                    
                    let videoViewButton = UIButton.init()
                    attachView.addSubview(videoViewButton)
                    videoViewButton.setUpConstraint(with: attachView)
                    
                    videoViewButton.addTarget(newsFeedCell, action: #selector(NewsFeedTableViewCell.handleTapAction(_:)), for: .touchUpInside)
                    
                    newsFeedCell.url = youtubeURL // url delegate to cell
                    
                }
            }
            
            if let feedUserAvatar = post.author.avatar {
                newsFeedCell.feedAvatarImage.sd_setIndicatorStyle(.whiteLarge)
                newsFeedCell.feedAvatarImage.sd_setShowActivityIndicatorView(true)
                newsFeedCell.feedAvatarImage.sd_setAnimationImages(with: [feedUserAvatar])
            }
            newsFeedCell.feedAvatarImage.makeRounded()
            
            newsFeedCell.createdNewsLabel.text   = post.created.stringPresentation
            newsFeedCell.firstNameNewsLabel.text = post.author.firstName
            newsFeedCell.lastNameNewsLabel.text  = post.author.lastName
            newsFeedCell.textNewsLabel.text      = post.body.text
            newsFeedCell.authorId = post.author.id
            newsFeedCell.delegate = self
            
            // Pagination - LoadNextPage
            
            if indexPath.row == self.posts.results.count - 1 {
                if self.posts.next != nil {
                    loadNextPage(indexPath)
                }
            }
            
            return newsFeedCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let section = SectionType(rawValue: section)!
        
        switch section {
            
        case .profile : return 0
        case .posts   : return 60
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //guard let _ = profile else { return nil }
        
        let section = SectionType(rawValue: section)!
        let sectionPost = posts.results[section.rawValue]
        
        switch section {
            
        case .profile:
            return nil
            
        case .posts:
            let postsHeaderCell = uiTableView.dequeueReusableHeaderFooterView(withIdentifier: "NewsFeedSectionCustomHeader") as! NewsFeedSectionCustomHeader
            postsHeaderCell.delegate = self
            
            switch order {
            case .ascending:
                postsHeaderCell.orderPostsButton.setTitle("Order: new first")
            case .descending:
                postsHeaderCell.orderPostsButton.setTitle("Order: old first")
            }
            
            switch filter {
            case .all:
                postsHeaderCell.filterPostsButton.setTitle("Filter: all")
            case .mine:
                postsHeaderCell.filterPostsButton.setTitle("Filter: mine")
                
            }
            postsHeaderCell.filterPostsButton.isEnabled = userId == nil
            let userName = sectionPost.author.firstName!
            if userId != nil {
                postsHeaderCell.filterPostsButton.setTitle("Filter: \(userName)")
                postsHeaderCell.orderPostsButton.isEnabled = false
            }
            return postsHeaderCell
        }
    }
}

// MARK: - NewsFeedSectionCustomHeaderDelegate extension

extension ProfileViewController: NewsFeedSectionCustomHeaderDelegate {
    
    func showFilterOptions() {
        self.showFilterFeedActionSheet()
    }
    
    func showOrderOptions() {
        self.showOrderByActionSheet()
    }
}
// MARK: - NewsFeedTableViewCellDelegate extension

extension ProfileViewController: NewsFeedTableViewCellDelegate {
    
    func switchToUser(_ id: Int) {
        let userProfileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let userProfileVC = userProfileStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as!  ProfileViewController
        userProfileVC.userId = id // userId JSON var
        self.navigationController?.pushViewController(userProfileVC, animated: true)
    }
}
