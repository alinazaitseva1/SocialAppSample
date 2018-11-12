//
//  CodeViewController.swift
//  SocializingApp
//
//  Created by Alina Zaitseva on 10/9/18.
//  Copyright © 2018 Alina Zaitseva. All rights reserved.
//

import UIKit
import PKHUD

#if DEBUG
private let resendDelay = 10.0
#else
private let resendDelay = 60.0
#endif

class CodeViewController: UIViewController, UITextFieldDelegate, TextFieldDeleteBackwardDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var firstCodeTextField: BackspaceTextField!
    @IBOutlet weak var secondCodeTextField: BackspaceTextField!
    @IBOutlet weak var thirdCodeTextField: BackspaceTextField!
    @IBOutlet weak var fourthCodeTextField: BackspaceTextField!
    @IBOutlet weak var okCodeButton: ChangeStateButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var resendButton: ChangeStateButton!
    
    // MARK: - Const
    
    private let oneFieldNumberLimit = 1
    private let limitTotalNumbersInCode = 4
    private let timeSpan = 0.5
    
    // MARK: - Vars
    
    var phoneNumber: String! // delegate from Login vc to user phone number
    
    private var code: String {
        return (firstCodeTextField.text! + secondCodeTextField.text! + thirdCodeTextField.text! + fourthCodeTextField.text!)
    } // gethered all text from text fields in one variable
    
    private var timer: Timer!
    private var timeLimit: Double = resendDelay
    private var textFields: [BackspaceTextField] {
        return [firstCodeTextField, secondCodeTextField, thirdCodeTextField, fourthCodeTextField]
    }
    
    // MARK: - Actions
    
    @IBAction func pushOkCodeButton(_ sender: ChangeStateButton) {
        codeValidation()
    }
    
    @IBAction func pushResendButton(_ sender: ChangeStateButton) {
        HUD.show(.progress)
        ApiCall.login(with: phoneNumber, completion: {
            self.startTimer()
            self.resendButton.isEnabled = false
            self.showAlert(title: "Code has been re-sent to this number:", message: self.phoneNumber)
            HUD.hide()
        })
    }
    
    // MARK: - Initilization functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startTimer()
    }
    // MARK: - Validation functions
    
    private func codeValidation() {
        
        // to validate code from ApiRequest
        HUD.show(.progress)
        ApiCall.validateCodeWith(phone: phoneNumber, enteredCode: code) { isCodeValid in
            if isCodeValid == true {
                let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
                
                let profileViewController = profileStoryboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                self.navigationController?.pushViewController(profileViewController, animated: true)
                HUD.hide()
            } else {
                self.showAlert(message: ValidationError.codeInvalid.localizedDescription)
            }
            
            UserDefaults.standard.setBooleanUserDefaults(flag: true, for: .token)
            UserDefaults.standard.setIntUserDefaults(value: 13, for: .userId)
        }
    }
    
    // MARK: - UITextFieldDelegate functions
    
    func textFieldDidEnterBackspace(_ textField: BackspaceTextField) {
        guard let index = textFields.index(of: textField) else {
            return
        }
        if index > 0 {
            guard textField.text?.isEmpty == true else { return }
            
            textField.isEnabled = false
            textFields[index - 1].becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
    }
    
    @IBAction func editingChangedCodeTextField(_ sender: UITextField) {
        let numbersInField = sender.text?.count ?? 0
        
        if numbersInField == oneFieldNumberLimit {
            switch sender {
                
            case firstCodeTextField:
                secondCodeTextField.isEnabled = true
                secondCodeTextField.becomeFirstResponder()
                
            case secondCodeTextField:
                thirdCodeTextField.isEnabled = true
                thirdCodeTextField.becomeFirstResponder()
                
            case thirdCodeTextField:
                fourthCodeTextField.isEnabled = true
                fourthCodeTextField.becomeFirstResponder()
                
            case fourthCodeTextField:
                fourthCodeTextField.resignFirstResponder()
                
            default:
                break
            }
        }
        
        okCodeButton.isEnabled = code.count == limitTotalNumbersInCode
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = textField.text ?? ""
        // Backspase case
        if string == "" { return true }
        
        let newLength = text.count + string.count - range.length
        var isValid = false
        var limitLength: Int?
        
        switch textField {
        case firstCodeTextField:
            isValid = Validator.symbolsValidateOnlyNumbers(string)
            limitLength = oneFieldNumberLimit
        case secondCodeTextField:
            isValid = Validator.symbolsValidateOnlyNumbers(string)
            limitLength = oneFieldNumberLimit
        case thirdCodeTextField:
            isValid = Validator.symbolsValidateOnlyNumbers(string)
            limitLength = oneFieldNumberLimit
        case fourthCodeTextField:
            isValid = Validator.symbolsValidateOnlyNumbers(string)
            limitLength = oneFieldNumberLimit
        default:
            break
        }
        
        let lengthValidate = newLength <= limitLength!
        return lengthValidate && isValid
    }
    
    // MARK: - Timer functions

    @objc func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: timeSpan,
                                         target: self,
                                         selector: #selector(onTimerTick),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    
    @objc func onTimerTick() {
        timeLimit -= timeSpan
        timeLabel.text = "\(Int(timeLimit))"
        if timeLimit == 0 {
            timeLimit = resendDelay
            timer.invalidate()
            timer = nil
             self.resendButton.isEnabled = true
        }
    }
}
