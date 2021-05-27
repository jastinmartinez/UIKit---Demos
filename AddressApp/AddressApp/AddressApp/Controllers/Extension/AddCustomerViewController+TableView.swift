//
//  AddCustomerViewControllerTableView.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import UIKit

extension AddCustomerViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerViewModel.customerTemporaryViewModel.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            customerViewModel.removeTemporalCustomer(at: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.reusbleIdentifier.addCustomerTableViewCell,for: indexPath) as! CustomerTableViewCell
        cell.setValueToOulets(customerViewModel.customerTemporaryViewModel[indexPath.row])
        return cell
    }
}
