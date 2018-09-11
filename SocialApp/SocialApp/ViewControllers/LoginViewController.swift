//
//  ViewController.swift
//  SocialApp
//
//  Created by Alina Zaitseva on 9/10/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var telephoneTextField: UITextField!
    let telephoneNumberLimit = 11
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // symbbols validate, requered?
    
    private func symbolsValidate (_ string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    // RegExp for validate telephone number
    
    func validate(string: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^(0[0-9]{2,3}\\-)?([2-9][0-9]{6,7})+(\\-[0-9]{1,4})?$")
        return regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil
    }
    
    func setDefaultBorderColor(for textField: UITextField) {
        textField.setAppropriateLookWith(color: #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1))
    }
    
    //MARK: Function to validate symbols amount in TextFields
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        setDefaultBorderColor(for: textField)
        
        guard let text = textField.text else { return true }
        
        let newLength = text.count + string.count - range.length
        var isValidationDone = false
        let limitLength: Int?
        
        if text.count <= telephoneNumberLimit {
            isValidationDone = symbolsValidate(string)
            limitLength = telephoneNumberLimit
        }
            let lengthValidate = newLength <= limitLength!
            return lengthValidate && isValidationDone
       
    }
    
    @IBAction func editingPhoneTextField(_ sender: UITextField) {
        
    }
    
    @IBAction func pushTelephoneButton(_ sender: UIButton) {
        
        guard let codeViewController = self.storyboard?.instantiateViewController(withIdentifier: "CodeInputViewController") as? CodeInputViewController else { return }
        self.navigationController?.pushViewController(codeViewController, animated: true)
        
    }
    
    
}

