//
//  ContactCreateViewController+CloseView.swift
//  Contacts
//
//  Created by Jastin on 31/10/21.
//

import Foundation

extension ContactCreateViewController: ContactPresenterProtocolCloseViewDelegate {
    
    func CloseViewAfterOperationComplete() {
    
        self.navigationController?.popViewController(animated: true)
    }
}
