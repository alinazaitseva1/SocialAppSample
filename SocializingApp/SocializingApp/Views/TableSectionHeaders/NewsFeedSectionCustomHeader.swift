//
//  NewsFeedSectionCustomHeader.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

protocol NewsFeedSectionCustomHeaderDelegate: class {
    func showOrderOptions()
    func showFilterOptions()
}

class NewsFeedSectionCustomHeader: UITableViewHeaderFooterView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var orderPostsButton: UIButton!
    @IBOutlet weak var filterPostsButton: UIButton!
    @IBOutlet weak var newsFeedView: UIView!
   
    // MARK: - Vars
    
    weak var delegate: NewsFeedSectionCustomHeaderDelegate?
    
    // MARK: - Actions
    
    @IBAction func pushOrderButton(_ sender: UIButton) {
        delegate?.showOrderOptions()
    }
    
    @IBAction func pushFilterButton(_ sender: UIButton) {
        delegate?.showFilterOptions()
    }
}
