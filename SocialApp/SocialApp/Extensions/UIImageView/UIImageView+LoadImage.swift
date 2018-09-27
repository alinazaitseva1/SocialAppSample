//
//  UIView+LoadImage.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/20/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImageWith(string: String) {
        guard let url = URL(string: string) else { return }
        loadImageWith(url: url)
    }
    
    func loadImageWith(url: URL, showLoader: Bool = false ,completion: (() -> Void)? = nil) {
        
        var activityIndicator: UIActivityIndicatorView?
        
        if showLoader {
            let loader = UIActivityIndicatorView(style: .gray)
            loader.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(loader)
            loader.startAnimating()

            loader.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            loader.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            
//            let loaderConstraint = NSLayoutConstraint.init(item: loader, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
            
//            loader.addConstraint(loaderConstraint)
            
            activityIndicator = loader
        }

        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            sleep(2)
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                activityIndicator?.removeFromSuperview()
                completion?()
            }
        }
    }
}
