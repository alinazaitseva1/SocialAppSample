//
//  CodeInputViewController.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class CodeInputViewController: UIViewController {

    @IBOutlet weak var firstCodeTextField: UITextField!
    @IBOutlet weak var secondCodeTextField: UITextField!
    @IBOutlet weak var thirdCodeTextField: UITextField!
    @IBOutlet weak var fourthCodeTextField: UITextField!
    let cardNumberLimit = 1
    let symbolsBeforeBackslash = 2
    var isSlashAdded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    private func numbersValidate (_ string: String) -> Bool {
        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func setDefaultBorderColor(for textField: UITextField) {
        textField.setAppropriateLookWith(color: #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1))
    }
    
    @IBAction func editingCodeTextField(_ sender: UITextField) {
    }
    
    
    @IBAction func sendCodeButton(_ sender: UIButton) {
        guard let userProfileViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserProfileViewController") as?  UserProfileViewController else { return }
        self.navigationController?.pushViewController(userProfileViewController, animated: true)
        
    }

}
