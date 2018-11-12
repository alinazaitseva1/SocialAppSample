//
//  UIButton+Title.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/18/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .disabled)
    }
}
