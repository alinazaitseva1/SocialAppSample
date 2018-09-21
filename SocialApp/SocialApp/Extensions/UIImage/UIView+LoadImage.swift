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
    
    public func loadImageFrom(urlString: String) {
        self.image = nil
        
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                ValidationError.invalidData.localizedDescription //????
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data!)
                self.image = image
            }
            
        }).resume()
    }
    
    
    
}
