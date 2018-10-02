//
//  CodeInputViewController.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/11/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class CodeInputViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var firstCodeTextField: UITextField!
    @IBOutlet weak var secondCodeTextField: UITextField!
    @IBOutlet weak var thirdCodeTextField: UITextField!
    @IBOutlet weak var fourthCodeTextField: UITextField!
    @IBOutlet weak var okCodeButton: ChangeStateButton!
    
    // MARK: - Constants
    
    let codeNumberLimit = 1
    let amountSymbolsInCode = 4
    
    // MARK: - Variables
    
    var phoneNumber = ""
    var code: String {
        return (firstCodeTextField.text! + secondCodeTextField.text! + thirdCodeTextField.text! + fourthCodeTextField.text!)
    }
    
    var userProfile: UserProfileEntity! // TODO: - investigate
    
    //MARK: - Actions
    
    @IBAction func sendCodeButton(_ sender: UIButton) {
        codeVerification()
    }
    
    // MARK: - Initialization functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Validation functions
    
    private func codeVerification() {
        
        // to validate code in TextField with Code from ApiRequest
        
        ApiRequest.validateCodeWith(phone: phoneNumber, enteredCode: code) { isCodeValid in
            let isUserValid = true
            if isUserValid == isCodeValid {
                // TODO: - If success (UserDefaults. value in key  == user id )
                // hidden button write a massege and add to friend
                let userProfileStoryboard = UIStoryboard(name: "UserProfile", bundle: nil)
                let userProfileVC = userProfileStoryboard.instantiateViewController(withIdentifier: "UserProfileViewController") as!  UserProfileViewController
                self.navigationController?.pushViewController(userProfileVC, animated: true)
            } else {
                self.showAlert(title: "Error", message: ValidationError.codeInvalid.localizedDescription)
            }
            
            UserDefaults.standard.setCustomUserDefaults(flag: true, for: .token)
           
            //UserDefaults.standard.set(T##value: Int##Int, forKey: T##String) // TODO: - save user id here
            
            let userProfileId = ApiRequest.getProfile(by: 12) { userProfile in
                self.userProfile = userProfile
            } // TODO: - get id from IP an save in some variable
        }
    }
    
    //MARK: - TextField functions
    
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
                textFieldShouldReturn(fourthCodeTextField)
            default:
                break
            }
        }
        okCodeButton.isEnabled = code.count == amountSymbolsInCode
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        ColorAssigner.setLook(for: textField)
        
        let text = textField.text ?? ""
        
        let newLength = text.count + string.count - range.length
        var isValidationDone = false
        var limitLength: Int?
        
        switch textField {
        case firstCodeTextField:
            isValidationDone = Validator.symbolsValidateOnlyNumbers(string)
            limitLength = codeNumberLimit
        case secondCodeTextField:
            isValidationDone = Validator.symbolsValidateOnlyNumbers(string)
            limitLength = codeNumberLimit
        case thirdCodeTextField:
            isValidationDone = Validator.symbolsValidateOnlyNumbers(string)
            limitLength = codeNumberLimit
        case fourthCodeTextField:
            isValidationDone = Validator.symbolsValidateOnlyNumbers(string)
            limitLength = codeNumberLimit
        default:
            break
        }
        
        let lengthValidate = newLength <= limitLength!
        return lengthValidate && isValidationDone
        
    }
    
    private func textFieldShouldBecome(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    private func textFieldShouldReturn(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}
