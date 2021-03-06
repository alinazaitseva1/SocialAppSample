//
//  ChangeStateButton.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/10/18.
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
                self.backgroundColor = CustomColor.lightGreenState.color
                self.layer.borderWidth = 1
            } else {
                self.backgroundColor = CustomColor.grayDefault.color
                self.layer.borderWidth = 1
            }
            super.isEnabled = newValue
        }
    }
}
