//
//  ChangeStateButton.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/18/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class ChangeStateButton: UIButton {
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        if (self.isEnabled == false) {
            self.backgroundColor = UIColor.clear
            self.borderWidth = 2
            self.cornerRadius = 20
        } else {
            self.backgroundColor = UIColor.clear
            self.borderWidth = 2
            self.cornerRadius = 20
        }
    }
}
