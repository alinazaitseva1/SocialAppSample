//
//  TextFieldDeleteBackward.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/22/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol TextFieldDeleteBackwardDelegate: class {
    func textFieldDidEnterBackspace(_ textField: BackspaceTextField)
}

class BackspaceTextField: UITextField {
    
    @IBOutlet weak var myDelegate: TextFieldDeleteBackwardDelegate?
    
    override func deleteBackward() {
        super.deleteBackward()
        myDelegate?.textFieldDidEnterBackspace(self)
    }
}
