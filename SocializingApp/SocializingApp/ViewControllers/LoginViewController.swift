//
//  ViewController.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/9/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit
import PhoneNumberKit
import PKHUD

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var telephoneTextField: PhoneNumberTextField!
    @IBOutlet weak var sendTelephoneButton: ChangeStateButton!
    
    // MARK: - Const
    
    private let limitNumbersInPhone = 15
    
    // MARK: - Vars
    
    private var phone: String {
        return telephoneTextField.text ?? ""
    }
    
    private var isNumberValid: Bool {
        if phone.count == limitNumbersInPhone {
            return true
        }
        
        return false
    }
    
    // MARK: - Actions
    
    @IBAction func pushSendPhoneButton(_ sender: ChangeStateButton) {
        if isNumberValid {
            HUD.show(.progress)
            ApiCall.login(with: phone, completion: {
                let authStoryboard = UIStoryboard(name: "Auth", bundle: nil)
                let codeViewController = authStoryboard.instantiateViewController(withIdentifier: "CodeViewController") as! CodeViewController
                codeViewController.phoneNumber = self.phone
                self.navigationController?.pushViewController(codeViewController, animated: true)
                HUD.hide()
            })
        } else {
            self.showAlert(message: ValidationError.invalidData.localizedDescription)
        }
    }
    
    // MARK: - Init functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let phoneNumberKit = PhoneNumberKit()
        let countryCode = phoneNumberKit.countryCode(for: "UA")!
        let country = phoneNumberKit.countries(withCode: countryCode)?.first!
        telephoneTextField.defaultRegion = country! 
        
        if UserDefaults.standard.bool(forKey: UserDefaultsKeys.token.rawValue) == true {
            let userProfileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
            let userProfileViewController = userProfileStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            
            self.navigationController?.pushViewController(userProfileViewController, animated: true)
        }
    }
    
    // MARK: - TextField functions
    
    @IBAction func editingChangedPhoneTextField(_ sender: UITextField) {
        sendTelephoneButton.isEnabled = isNumberValid
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Backspase case
        if string == "" { return true }
        
        let text = textField.text ?? ""
        
        let newLength = text.count + string.count + range.length
        var isValid = false
        var limitLength: Int?
        
        if textField == telephoneTextField {
            isValid = Validator.symbolsValidateOnlyNumbers(string)
            limitLength = limitNumbersInPhone
        }
        
        let validLength = newLength <= limitLength!
        return validLength && isValid
    }
}
