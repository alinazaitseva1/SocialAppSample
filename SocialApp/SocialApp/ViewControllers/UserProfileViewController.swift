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
    
    //MARK: - Actions
    
    @IBAction func pushLogoutButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Initialization functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsFeedTableViewCell")
        uiTableView.rowHeight = UITableView.automaticDimension
        //        uiTableView.register(UINib(nibName: "UserProfileCounterCollectionViewCell", bundle: nil), forCellReuseIdentifier: "UserProfileCounterCollectionViewCell") //TODO: Put in xib
        
    }
}
extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == SectionType.profile.rawValue {
            return ProfileRowType.rows.count
        } else if section == SectionType.posts.rawValue {
            return PostsRowType.rows.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = SectionType(indexPath: indexPath as NSIndexPath)!
        
        switch section {
        case .profile:
            let row = ProfileRowType(indexPath: indexPath as NSIndexPath)!
            switch row {
            case .photo:
                let photoCell = uiTableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as! PhotoTableViewCell
                photoCell.mainAvatarImage.makeRounded()
                return photoCell
            case .info:
                let infoCell = uiTableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
                return infoCell
            case .actions:
                let actionsCell = uiTableView.dequeueReusableCell(withIdentifier: "ActionsTableViewCell", for: indexPath) as! ActionsTableViewCell
                return actionsCell
            case .collectionInfo:
                let collectionInfoCell = uiTableView.dequeueReusableCell(withIdentifier: "CollectionInfoTableViewCell", for: indexPath) as! CollectionInfoTableViewCell
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
                newsFeedCell.newsAvatarImage.makeRounded()
                return  newsFeedCell
            }
        }
        
    }
}
