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
    var codeCharacters = [String]()
    var phoneNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiRequest.getResponse(for: phoneNumber) { (code) in
            code?.forEach() {
                self.codeCharacters.append(String($0))
            }
            print("code: \(code!)")
        }
    }
    
    // symbols validate
    
    private func symbolsValidate (_ string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func setDefaultBorderColor(for textField: UITextField) {
        textField.setAppropriateLookWith(color: #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1), border: 1)
    }
    
    // Function to validate symbols amount in TextFields
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        setDefaultBorderColor(for: textField)
        
        guard let text = textField.text else { return true }
        
        let newLength = text.count + string.count - range.length
        var isValidationDone = false
        var limitLength: Int?
        
        switch textField {
        case firstCodeTextField:
            isValidationDone = symbolsValidate(string)
            limitLength = codeNumberLimit
        case secondCodeTextField:
            isValidationDone = symbolsValidate(string)
            limitLength = codeNumberLimit
        case thirdCodeTextField:
            isValidationDone = symbolsValidate(string)
            limitLength = codeNumberLimit
        case fourthCodeTextField:
            isValidationDone = symbolsValidate(string)
            limitLength = codeNumberLimit
        default:
            break
        }
        
        let lengthValidate = newLength <= limitLength!
        return lengthValidate && isValidationDone
        
    }
    
    @IBAction func editingCodeTextField(_ sender: UITextField) {
        let numbersInField = sender.text?.count ?? 0
        if numbersInField == codeNumberLimit {
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
    
    private func codeValid() -> Bool {
        if firstCodeTextField.text == codeCharacters[0],
            secondCodeTextField.text == codeCharacters[1],
            thirdCodeTextField.text == codeCharacters[2],
            fourthCodeTextField.text == codeCharacters[3] {
            print("VALID")
            return true
        } else {
            print("INVALID")
            self.showAlert(title: "Error", message: ValidationError.codeInvalid.errorDescription!)
            return false
        }
    }
    
    @IBAction func sendCodeButton(_ sender: UIButton) {
        if codeValid() {
            let userProfileViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserProfileViewController") as!  UserProfileViewController
            self.navigationController?.pushViewController(userProfileViewController, animated: true)
           
        }
    }
    
    private func textFieldShouldBecome(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
}
