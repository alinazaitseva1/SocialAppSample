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
    static var numberOfSection = [SectionType.profile, SectionType.posts]
    
    //    static var numberOfSections: Int {
    //        var count = 0
    //        while let _ = SectionType(rawValue: count) {
    //            count += 1
    //        }
    //        return count
    //    } TODO: ????
}

private enum Profile: Int {
    case photo
    case info
    case actions
    case collectionInfo
    
    init?(indexPath: NSIndexPath) {
        self.init(rawValue: indexPath.section)
    }
    
    static var numberOfRowProfile = [Profile.photo, Profile.info, Profile.actions, Profile.collectionInfo]
}

private enum Posts: Int {
    case actionWithPosts
    case newsFeed
    
    init?(indexPath: NSIndexPath) {
        self.init(rawValue: indexPath.section)
    }
    
    static var numberOfRowPosts = [Posts.actionWithPosts, Posts.newsFeed]
}

class UserProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var uiTableView: UITableView!
    
    // MARK: - Init functions
    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView.register(UINib(nibName: "NewsFeedTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsFeedTableViewCell")
    }
}
extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.numberOfSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        _ = tableView.dequeueReusableCell(withIdentifier: "NewsFeedTableViewCell", for: indexPath) as! NewsFeedTableViewCell // TODO: For instantiatexib in storyboards
        //        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.reuseIdentifier, for: indexPath) as? PhotoTableViewCell
        
        return UITableViewCell()
    }
    
    
}
