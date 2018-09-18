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
    
    // MARK: - Constants and Variables
    
    let codeNumberLimit = 1
    var codeCharacters = [String]()
    var phoneNumber = ""
    var isUserValid = false {
        didSet {
            if isUserValid {
                let userProfileStoryboard = UIStoryboard(name: "UserProfile", bundle: nil)
                let userProfileVC = userProfileStoryboard.instantiateViewController(withIdentifier: "UserProfileViewController") as!  UserProfileViewController
                self.navigationController?.pushViewController(userProfileVC, animated: true)
            } else {
                self.showAlert(title: "Error", message: ValidationError.codeInvalid.localizedDescription)
            }
        }
    }
    
    //MARK: - Actions
    
    @IBAction func sendCodeButton(_ sender: UIButton) {
        codeValid()
    }
    
    // MARK: - Initialization functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Validation functions
    
    private func codeValid() {
        // to validate code in TextField with Code from ApiRequest
        let code = (firstCodeTextField.text! + secondCodeTextField.text! + thirdCodeTextField.text! + fourthCodeTextField.text!)
        
        ApiRequest.validateCode(phone: phoneNumber, enteredCode: code) { validationResult in
            self.isUserValid = validationResult!
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
