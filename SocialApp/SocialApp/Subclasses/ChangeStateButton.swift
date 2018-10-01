//
//  ChangeStateButton.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/18/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class ChangeStateButton: UIButton {
    
    override var isEnabled: Bool {
        get {
            return super.isEnabled
        }
        set {
            if newValue == true {
                self.backgroundColor = CustomColor.grayDefault.color
                self.borderWidth = 1
            } else {
                self.backgroundColor = CustomColor.disabledGrayColor.color
                self.borderWidth = 1
            }
            super.isEnabled = newValue
        }
    }
}
