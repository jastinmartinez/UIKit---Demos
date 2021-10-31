//
//  ContatcViewController+UpdateTableView.swift
//  Contacts
//
//  Created by Jastin on 31/10/21.
//

import Foundation


extension ContactViewController: ContactPresenterProtocolNotifyTableViewDelegate {
    
    func NotifyTableViewAfterOperationComplete() {
        
        DispatchQueue.main.async {
            
            self.contactTableView.reloadData()
        }
    }
    
}
