//
//  Contact.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import Foundation
import UIKit

class ContactsPresenter : ContatcsProtocol {
    
    private (set) var contacts = [Contact]()
    
    func addContact(_ contact: Contact) {
        
        contacts.append(contact)
        
        print(contacts)
    }
    
    func editContact(_ contact: Contact) {
        
        if let customerIndex = contacts.firstIndex(where: {$0.id == contact.id}) {
            
            contacts[customerIndex] = contact
        }
    }
    
    func removeContact(_ contactID: UUID) {
        
        if let customerIndex = contacts.firstIndex(where: {$0.id == contactID}) {
            
            contacts.remove(at: customerIndex)
        }
    }
    
    func generateAvatar(name: String,completion: @escaping (UIImage) -> ()) {
        
        APIService().getAvatar(name: name) { data in
            
            if let image = UIImage(data: data) {
                
                completion(image)
            }
        }
    }
}
