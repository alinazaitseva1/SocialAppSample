//
//  ViewController.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/10/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var telephoneTextField: UITextField!
    
    // MARK: - Constants and Variables
    let telephoneNumberLimit = 12
    
    // MARK: - Actions
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
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func validateNumber(string: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^(0[0-9]{2,3}\\-)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?$")  // RegExp to validate telephone number
        return regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        ColorPicker.setBorderColor(for: textField)
        
        guard let text = textField.text else { return true }
        
        let newLength = text.count + string.count - range.length
        var isValidationDone = false
        var limitLength: Int?
        
        if textField == telephoneTextField {
            isValidationDone = Validator.symbolsValidate(string)
            limitLength = telephoneNumberLimit
        }
        let lengthValidate = newLength <= limitLength!
        return lengthValidate && isValidationDone
        
    }
    
    var isValid: Bool {
        // check if amount of symbols and regEx is valid
        let telephoneNumber = telephoneTextField.text?.count
        if telephoneNumber == telephoneNumberLimit {
            return validateNumber(string: self.telephoneTextField.text!)
        }
        return false
    }
    

}
