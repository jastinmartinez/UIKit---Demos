//
//  AddCustomerControllerNotifyChange.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import Foundation

extension AddCustomerViewController: NotifyCustomerView  {
    
    func didCustomerChange() {
        addCustumerTableView.reloadData()
        clenaIboutets()
    }
}
