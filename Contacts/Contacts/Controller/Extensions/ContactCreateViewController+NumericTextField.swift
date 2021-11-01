//
//  ContactCreateViewController+NumericTextField.swift
//  Contacts
//
//  Created by Jastin on 31/10/21.
//

import Foundation
import UIKit

extension ContactCreateOrEditViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return CharacterSet(charactersIn: "1234567890-").isSuperset(of: CharacterSet(charactersIn: string)) && range.location <= 14
    }
}
