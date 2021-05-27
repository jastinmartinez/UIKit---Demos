//
//  CustomerViewController+TableView.swift
//  AddressApp
//
//  Created by Jastin on 27/5/21.
//

import UIKit

extension CustomerViewController:  UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerViewModel.customersViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.reusbleIdentifier.customerTableViewCell) as! CustomerTableViewCell
        cell.setValueToOulets(customerViewModel.customersViewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        DbHelper().setTemporalKey(id: customerViewModel.customersViewModels[indexPath.row].customer.id!.uuidString, obj: .Address)
        performSegue(withIdentifier: Constant.segue.addAddressViewController, sender: nil)
    }
}
