//
//  UIViewControlller+Alert.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String? = nil, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        present(alert, animated: true, completion: nil)
    }

}
