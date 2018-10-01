//
//  ConstraintAnchors.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 10/1/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

struct ConstraintAnchors {
    let top      : NSLayoutYAxisAnchor
    let trailing : NSLayoutXAxisAnchor
    let leading  : NSLayoutXAxisAnchor
    let bottom   : NSLayoutYAxisAnchor
    init(with view: UIView) {
        top      = view.topAnchor
        trailing = view.trailingAnchor
        leading  = view.leadingAnchor
        bottom   = view.bottomAnchor
    }
}
