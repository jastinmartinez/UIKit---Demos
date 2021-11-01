//
//  ContactCreateViewController+RequiredFieldsAndValidations.swift
//  Contacts
//
//  Created by Jastin on 31/10/21.
//

import Foundation
import UIKit

extension ContactCreateOrEditViewController {
    
     func requiredFields(completion: ((firstName:String, phoneNumber:String)) -> ()) {
        
        guard let firstName = contactFirstNameTextField.text,!firstName.isEmpty else {
            
            showMessageForRequiredField(alert: RequiredFieldsAlerViewController(message: "Fist Name").alert)
            return
        }
        
        guard let phoneNumber = contactPhoneTextField.text,!phoneNumber.isEmpty else {
            
            showMessageForRequiredField(alert: RequiredFieldsAlerViewController(message: "Phone Number").alert)
            return
        }
         
         guard phoneNumber.count > 9 else { showMessageForRequiredField(alert: RequiredFieldsAlerViewController(message: "Phone Number is not complete missing \(10 - phoneNumber.count) to complete").alert)
             return
         }
        
        
        completion((firstName,phoneNumber))
    }
    
    
    private func showMessageForRequiredField(alert: UIAlertController) {
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
