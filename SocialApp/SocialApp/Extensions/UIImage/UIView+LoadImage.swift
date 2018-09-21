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
    
    func loadImageWith(url: URL) {
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
    }
    
}
