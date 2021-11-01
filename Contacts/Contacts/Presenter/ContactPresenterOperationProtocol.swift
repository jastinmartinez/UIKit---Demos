//
//  ContactPresenterOperationProtocol.swift
//  Contacts
//
//  Created by Jastin on 31/10/21.
//

import Foundation

protocol ContactPresenterOperationProtocol {
    
    func addContact(_ contact: Contact)
    
    func editContact(_ contact: Contact)
    
    func removeContact()
    
}
