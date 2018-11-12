//
//  UIImageView+LoadImage.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/16/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func setImageUsingUrl(_ imageUrl: String?) {
        self.sd_setImage(with: URL(string: imageUrl!))
    }
}
