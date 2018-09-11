//
//  CodeInputViewController.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class CodeInputViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstCodeTextField: UITextField!
    @IBOutlet weak var secondCodeTextField: UITextField!
    @IBOutlet weak var thirdCodeTextField: UITextField!
    @IBOutlet weak var fourthCodeTextField: UITextField!
    let codeNumberLimit = 1

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
        let numbersInField = sender.text?.count
        if numbersInField! == codeNumberLimit {
            switch sender {
            case firstCodeTextField :
                secondCodeTextField.isEnabled = true
                textFieldShouldBecome(secondCodeTextField)
            case secondCodeTextField :
                thirdCodeTextField.isEnabled = true
                textFieldShouldBecome(thirdCodeTextField)
            case thirdCodeTextField :
                fourthCodeTextField.isEnabled = true
                textFieldShouldBecome(fourthCodeTextField)
            case fourthCodeTextField:
                fourthCodeTextField.resignFirstResponder()
            default:
                break
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    @IBAction func sendCodeButton(_ sender: UIButton) {
        guard let userProfileViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserProfileViewController") as?  UserProfileViewController else { return }
        self.navigationController?.pushViewController(userProfileViewController, animated: true)
    }
    
    private func textFieldShouldBecome(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }

}
