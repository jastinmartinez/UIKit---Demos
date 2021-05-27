//
//  AddViewControllerInputValidation.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import UIKit

extension AddCustomerViewController {
    
    @objc private func email(textField: UITextField)  {
        
        if (textField.text!.isEmpty) {
            emailErrorLabel.text = "email is blank"
            emailErrorLabel.isHidden = false
        }
        else if ( !isValidEmail(textField.text!) ) {
            emailErrorLabel.text = "Invalid Email"
            emailErrorLabel.isHidden = false
        }
        else {
            emailErrorLabel.text = ""
            emailErrorLabel.isHidden = true
        }
    }
    
    @objc private func name(textField: UITextField)  {
        
        if (textField.text!.isEmpty) {
            nameErrorLabel.text = "name is blank"
            nameErrorLabel.isHidden = false
        }
        else if(textField.text!.count < 4){
            nameErrorLabel.text = "name is short recommended (4) missing (\(4 - textField.text!.count))"
            nameErrorLabel.isHidden = false
        }
        else  {
            nameErrorLabel.text = ""
            nameErrorLabel.isHidden = true
        }
    }
    
    @objc private func phone(textField: UITextField)  {
        
        if (textField.text!.isEmpty) {
            phoneNumberErrorLabel.text = "PhoneNumber is blank"
            phoneNumberErrorLabel.isHidden = false
        }
        else if(!isPhoneValid(textField.text!)){
            phoneNumberErrorLabel.text = "Invalid PhoneNumber"
            phoneNumberErrorLabel.isHidden = false
        }
        else {
            phoneNumberErrorLabel.text = ""
            phoneNumberErrorLabel.isHidden = true
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isPhoneValid(_ value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
    
     func isInputValidationComplete(completion: (Bool) -> ()) {
        if let email = emailErrorLabel.text, let name = nameErrorLabel.text,let phoneNumber = phoneNumberErrorLabel.text {
            completion( email.isEmpty && name.isEmpty && phoneNumber.isEmpty)
        }
    }
    
    func initiateValidationEvents()  {
        customerEmailTextField.addTarget(self, action: #selector(email), for: .editingChanged)
        customerNameTextField.addTarget(self, action: #selector(name), for: .editingChanged)
        customerPhoneNumberTextField.addTarget(self, action: #selector(phone), for: .editingChanged)
    }
}
