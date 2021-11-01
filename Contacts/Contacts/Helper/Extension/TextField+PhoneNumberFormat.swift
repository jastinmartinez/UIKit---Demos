//
//  TextField+PhoneNumberFormat.swift
//  Contacts
//
//  Created by Jastin on 1/11/21.
//

import Foundation
import UIKit

extension UILabel {
    
    func phoneNumberFormat() {
        
        if let text = self.text {
            
            var arrayOfCharacter = text.map({$0}) as [Character]
            
            if arrayOfCharacter.filter({$0.isNumber}).count == arrayOfCharacter.count {
                
                    arrayOfCharacter.insert("-", at: 3)
                    arrayOfCharacter.insert("-", at: 7)
                
                    self.text = String(arrayOfCharacter)
            }
        }
    }
}
