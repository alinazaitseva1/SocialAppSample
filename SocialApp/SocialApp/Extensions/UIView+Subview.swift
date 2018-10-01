//
//  UIView+Subview.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/28/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

 // MARK: Add constraints View -> subView

extension UIView {
    
    func activate(leading: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
                  trailing: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
                  top: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
                  bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let leading = leading   { leadingAnchor.constraint(equalTo: leading).isActive = true }
        if let trailing = trailing { trailingAnchor.constraint(equalTo: trailing).isActive = true }
        if let top = top           { topAnchor.constraint(equalTo: top).isActive = true }
        if let bottom = bottom     { bottomAnchor.constraint(equalTo: bottom).isActive = true }
    }
    
    func addSubviewTo() {
        
    }
    
}
