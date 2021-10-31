//
//  Contact.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import Foundation
import UIKit
import SVGKit

class ContactsPresenter : ContactPresenterAvatarProtocol,ContactPresenterOperationProtocol {
    
    private (set) var contacts = [Contact]() {
        
        didSet {
            
            self.contactCloseViewDelegate?.CloseViewAfterOperationComplete()
            
            self.contactNotifyTableViewDelegate?.NotifyTableViewAfterOperationComplete()
        }
    }
    
    var contactCloseViewDelegate: ContactPresenterProtocolCloseViewDelegate?
    
    var contactNotifyTableViewDelegate: ContactPresenterProtocolNotifyTableViewDelegate?
    
    func addContact(_ contact: Contact) {
        
        contacts.append(contact)
    }
    
    func editContact(_ contact: Contact) {
        
        if let customerIndex = contacts.firstIndex(where: {$0.id == contact.id}) {
            
            contacts[customerIndex] = contact
        }
    }
    
    func removeContact(_ contactID: String) {
        
        if let customerIndex = contacts.firstIndex(where: {$0.id == contactID}) {
            
            contacts.remove(at: customerIndex)
        }
    }
    
    func generateAvatar(name: String,completion: @escaping (UIImage) -> ()) {
        
        APIService().getAvatar(name: name) { imageData in
            
            if let image = SVGKImage(data: imageData) {
                
                completion(image.uiImage)
            }
        }
    }
}
