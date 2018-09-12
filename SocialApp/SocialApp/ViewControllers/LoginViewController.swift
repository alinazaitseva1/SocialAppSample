//
//  ViewController.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/10/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var telephoneTextField: UITextField!
    let telephoneNumberLimit = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // symbols validate
    
    private func symbolsValidate (_ string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    // RegExp to validate telephone number
    
    func validateNumber(string: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^(0[0-9]{2,3}\\-)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?$")
        return regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil
    }
    
    func setDefaultBorderColor(for textField: UITextField) {
        textField.setAppropriateLookWith(color: #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1))
    }
    
    // Function to validate symbols amount in TextFields
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        setDefaultBorderColor(for: textField)
        
        guard let text = textField.text else { return true }
        
        let newLength = text.count + string.count - range.length
        var isValidationDone = false
        var limitLength: Int?
        
        if textField == telephoneTextField {
            isValidationDone = symbolsValidate(string)
            limitLength = telephoneNumberLimit
        }
            let lengthValidate = newLength <= limitLength!
            return lengthValidate && isValidationDone
       
    }
    
    // check symbols validation
    
    var isValid: Bool {
       let telephoneNumber = telephoneTextField.text?.count
        if telephoneNumber == telephoneNumberLimit {
            validateNumber(string: self.telephoneTextField.text!)
            return true
        } else {
            telephoneTextField.setAppropriateLookWith(color: .red)
        }
        return false
    }
    
    @IBAction func editingPhoneTextField(_ sender: UITextField) {
         isValid
    }
    
   
    
    @IBAction func pushTelephoneButton(_ sender: UIButton) {
        if isValid {
            guard let codeViewController = self.storyboard?.instantiateViewController(withIdentifier: "CodeInputViewController") as? CodeInputViewController else { return }
            codeViewController.phone = telephoneTextField.text!
            self.navigationController?.pushViewController(codeViewController, animated: true)
        } else {
            self.showAlert(title: "Error", message: ValidationError.invalidData.localizedDescription)
        }
    }
}

