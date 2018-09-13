//
//  ViewController.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/10/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var telephoneTextField: UITextField!
    
    // MARK: Constants and Variables
    let telephoneNumberLimit = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Functions
    
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
    
    func setBorderColor(for textField: UITextField) {
        textField.setDefaultLookWith(color: CustomColor.grayDefault.color, border: 1)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        setBorderColor(for: textField)
        
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
            return validateNumber(string: self.telephoneTextField.text!)
        } else {
            telephoneTextField.setDefaultLookWith(color: CustomColor.redError.color, border: 1) // TODO: Remove
        }
        return false
    }
    
    @IBAction func editingPhoneTextField(_ sender: UITextField) {
        if isValid {}
    }
    
   
    @IBAction func pushTelephoneButton(_ sender: UIButton) {
        if isValid {
           let codeViewController = self.storyboard?.instantiateViewController(withIdentifier: "CodeInputViewController") as! CodeInputViewController 
            codeViewController.phoneNumber = telephoneTextField.text!
            self.navigationController?.pushViewController(codeViewController, animated: true)
        } else {
            self.showAlert(title: "Error", message: ValidationError.invalidData.errorDescription!)
        }
    }
}
