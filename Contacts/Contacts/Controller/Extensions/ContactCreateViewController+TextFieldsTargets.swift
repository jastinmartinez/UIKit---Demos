//
//  ContactViewController+.swift
//  Contacts
//
//  Created by Jastin on 31/10/21.
//

import Foundation
import UIKit

extension ContactCreateViewController {
    
    
    @objc private func contactFirstNameTextFieldeditingDidEnd(_ textField: UITextField) {
        
        if let fistName = textField.text,!fistName.isEmpty {
            
            self.contactPresenter?.generateAvatar(name: fistName) { avatar in
                
                DispatchQueue.main.async {
                    
                    self.contactPictureImageView.image = avatar
                }
            }
        }
        else {
            self.contactPictureImageView.image = UIImage(systemName: "camera")
        }
    }
    
    func prepareTextFieldsTargets() {
        
        self.contactFirstNameTextField.addTarget(self, action: #selector(contactFirstNameTextFieldeditingDidEnd), for: .editingDidEnd)
    }
}
