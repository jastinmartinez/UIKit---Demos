//
//  ContactProtocol.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import Foundation
import UIKit

protocol ContatcsProtocol {
    
    func addContact(_ contact: Contact)
    
    func editContact(_ contact: Contact)
    
    func removeContact(_ contactID: UUID)
    
    func generateAvatar(name: String,completion: @escaping (UIImage) -> ())
}
