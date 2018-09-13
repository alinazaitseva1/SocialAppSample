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
    
    //MARK: - Actions
    @IBAction func sendCodeButton(_ sender: UIButton) {
        if codeValid() {
            let userProfileViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserProfileViewController") as!  UserProfileViewController
            self.navigationController?.pushViewController(userProfileViewController, animated: true)
            
        }
    }
    
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiRequest.captureResponse(for: phoneNumber) { (code) in
            code?.forEach() {
                self.codeCharacters.append(String($0))
            }
            print("code: \(code!)")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        ColorPicker.setBorderColor(for: textField)
        
        guard let text = textField.text else { return true }
        
        let newLength = text.count + string.count - range.length
        var isValidationDone = false
        var limitLength: Int?
        
        switch textField {
        case firstCodeTextField:
            isValidationDone = Validator.symbolsValidate(string)
            limitLength = codeNumberLimit
        case secondCodeTextField:
            isValidationDone = Validator.symbolsValidate(string)
            limitLength = codeNumberLimit
        case thirdCodeTextField:
            isValidationDone = Validator.symbolsValidate(string)
            limitLength = codeNumberLimit
        case fourthCodeTextField:
            isValidationDone = Validator.symbolsValidate(string)
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
                textFieldShouldReturn(fourthCodeTextField)
            default:
                break
            }
        }
    }
    
    private func codeValid() -> Bool {
        // to validate code in TextField with Code from ApiRequest
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
    
    private func textFieldShouldBecome(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    private func textFieldShouldReturn(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}
