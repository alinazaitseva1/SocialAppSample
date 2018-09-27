//
//  SFSafaryViewController.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/27/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit
import SafariServices

class SFSafaryViewController: UIViewController, SFSafariViewControllerDelegate {
    
    // MARK: - Variables
    
    var exactURL: String?
    var isClosing = false
    
    // MARK: - Initialization functions
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        guard let url = URL(string: self.exactURL!) else {
            self.showAlert(title: "Error", message:  ValidationError.pageNotExist.localizedDescription)
            return
        }
        
        let safaryController = SFSafariViewController(url: url)
        safaryController.delegate = self
        
        if isClosing {
            dismiss(animated: true)
        } else {
            self.present(safaryController, animated: true)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        isClosing = true
    }
}
