//
//  ContactDetailView+NotifyWhenEdit.swift
//  Contacts
//
//  Created by Jastin on 1/11/21.
//

import Foundation

extension ContactDetailsViewController : ContactPresenterProtocolNotifyContactDetailViewWhenEditDelegate {
    
    func isDoneOperationEdit() {
        preparationOfContactDetail()
    }
}
