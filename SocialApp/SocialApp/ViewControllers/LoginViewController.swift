//
//  ViewController.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/10/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit
import PhoneNumberKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var telephoneTextField: PhoneNumberTextField!
    
    // MARK: - Constants and Variables
    
    let telephoneNumberLimit = 14 // TODO ?? 16 ??
    
    // MARK: - Actions
    
    @IBAction func pushTelephoneButton(_ sender: UIButton) {
        if isValid {
            let phoneNumber = telephoneTextField.text!
            if ApiRequest.login(with: phoneNumber) {
                // TODO: use saved vc
            } else {
                let codeViewController = self.storyboard?.instantiateViewController(withIdentifier: "CodeInputViewController") as! CodeInputViewController
                codeViewController.phoneNumber = telephoneTextField.text!
                self.navigationController?.pushViewController(codeViewController, animated: true)
            }
        } else {
            self.showAlert(title: "Error", message: ValidationError.invalidData.localizedDescription)
        }
    }
    
    // MARK: - Initialization functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.telephoneTextField.defaultRegion = "FR" TODO: Investigate region
    }
    
    // MARK: - Validation functions
    
    func validateNumber(string: String) -> Bool { // TODO: Nedless?
        let regex = try! NSRegularExpression(pattern: "^[0-9]{2}[(]{0,1}[0-9]{1,4}[)]{0,1}[0-9]*$")  // RegExp to validate telephone number
        return regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil
    }
    
    var isValid: Bool {
        // check if amount of symbols and regEx is valid
        let telephoneNumber = telephoneTextField.text?.count
        if telephoneNumber == telephoneNumberLimit {
            return true
            //return validateNumber(string: self.telephoneTextField.text!) //TODO:
        }
        return false
    }
    
    // MARK: TextField functions
    
    @IBAction func editingPhoneTextField(_ sender: UITextField) {
        if isValid {}
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        ColorAssigner.setLook(for: textField)
        
        let text = textField.text ?? ""
        
        let newLength = text.count + string.count - range.length
        var isValidationDone = false
        var limitLength: Int?
        
        if textField == telephoneTextField {
            isValidationDone = Validator.symbolsValidateOnlyNumbers(string)
            limitLength = telephoneNumberLimit
        }
        let lengthValidate = newLength <= limitLength!
        return lengthValidate && isValidationDone
        
    }
}
