//
//  AddAddressViewController+TableView.swift
//  AddressApp
//
//  Created by Jastin on 27/5/21.
//

import UIKit
extension AddAddressViewController: UITableViewDataSource, UITableViewDelegate  {
   
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addAddressViewModel.temporalAddressViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.reusbleIdentifier.addAddressTableViewCell) as! AddressTableViewCell
        
        cell.setValueToOutlest(addAddressViewModel.temporalAddressViewModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            addAddressViewModel.removeTemporalCustomer(at: indexPath.row)
        }
    }
}
