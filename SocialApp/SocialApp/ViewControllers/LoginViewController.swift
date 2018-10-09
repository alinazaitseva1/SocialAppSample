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
    @IBOutlet weak var sendButton: ChangeStateButton!
    
    // MARK: - Constants
    
    let telephoneNumberLimit = 14
    
    // MARK: - Variables
    
    var phone: String {
        return telephoneTextField.text!
    }
    
    // MARK: - Actions
    
    @IBAction func pushTelephoneButton(_ sender: UIButton) {
        if isValid {
            let phoneNumber = telephoneTextField.text!
            ApiRequest.login(with: phoneNumber, completion: {
                let codeViewController = self.storyboard?.instantiateViewController(withIdentifier: "CodeInputViewController") as! CodeInputViewController
                codeViewController.phoneNumber = phoneNumber
                self.sendButton.isUserInteractionEnabled = false
                self.navigationController?.pushViewController(codeViewController, animated: true)
            })
        } else {
            self.showAlert(title: "Error", message: ValidationError.invalidData.localizedDescription)
        }
    }
    
    // MARK: - Initialization functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.bool(forKey: UserDefaultsKeys.token.rawValue) == true {
            let userProfileStoryboard = UIStoryboard(name: "UserProfile", bundle: nil)
            let userProfileVC = userProfileStoryboard.instantiateViewController(withIdentifier: "UserProfileViewController") as!  UserProfileViewController
            self.navigationController?.pushViewController(userProfileVC, animated: true)
            
        }
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
        }
        return false
    }
    
    // MARK: TextField functions
    
    @IBAction func editingPhoneTextField(_ sender: UITextField) {
        if isValid {}
        sendButton.isEnabled = phone.count == telephoneNumberLimit
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
