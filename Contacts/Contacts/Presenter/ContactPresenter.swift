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
            
            self.contactNotifyTableViewDelegate?.isDoneWithAnyCrudOperation()
        }
    }
    
    var contact:Contact?
    
    var contactCloseViewDelegate: ContactPresenterProtocolCloseViewAfterOperationDelegate?
    
    var contactNotifyTableViewDelegate: ContactPresenterProtocolNotifyTableViewDelegate?
    
    var contactPresenterProtocolNotifyDetailView: ContactPresenterProtocolNotifyContactDetailViewWhenEditDelegate?
    
    func addContact(_ contact: Contact) {
        
        contacts.append(contact)
        self.contactCloseViewDelegate?.isDoneWithAnyOperation(actionView: .create)
    }
    
    func editContact(_ outcontact: Contact) {
        
        if let customerIndex = contacts.firstIndex(where: {$0.id == outcontact.id}) {
            
            contact = outcontact
            
            contacts[customerIndex] = outcontact
            
            self.contactPresenterProtocolNotifyDetailView?.isDoneOperationEdit()
            
            self.contactCloseViewDelegate?.isDoneWithAnyOperation(actionView: .edit)
        }
    }
    
    func removeContact() {
        
        if let customerIndex = contacts.firstIndex(where: {$0.id == contact?.id}) {
            
            contacts.remove(at: customerIndex)
            
            self.contactCloseViewDelegate?.isDoneWithAnyOperation(actionView: .delete)
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
