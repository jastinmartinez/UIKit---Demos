//
//  AddAddressViewControlelr+NotifyView.swift
//  AddressApp
//
//  Created by Jastin on 27/5/21.
//

import Foundation

extension AddAddressViewController: NotifyAddressView {
    func didAddressChange() {
        self.addAddressTableView.reloadData()
        cleanIboutlets()
    }
}

