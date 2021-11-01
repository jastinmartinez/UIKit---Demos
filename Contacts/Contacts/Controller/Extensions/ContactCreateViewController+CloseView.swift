//
//  ContactCreateViewController+CloseView.swift
//  Contacts
//
//  Created by Jastin on 31/10/21.
//

import Foundation

extension ContactCreateOrEditViewController: ContactPresenterProtocolCloseViewAfterOperationDelegate {
    
    func isDoneWithAnyOperation(actionView: ActionInView) {
        
        if actionView == .create || actionView == .edit {
            
            self.navigationController?.popViewController(animated: true)
        }
        else {
            navigationController?.popToRootViewController(animated: true)
        }
    }
}
