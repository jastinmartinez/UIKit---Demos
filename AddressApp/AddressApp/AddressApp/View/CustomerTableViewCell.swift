//
//  AddCustomerTableViewCell.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var customerEmailLabel: UILabel!
    @IBOutlet weak var customerPhoneNumberLabel: UILabel!
    
    func setValueToOulets(_ vm: CustomerViewModel)  {
        customerNameLabel.text = vm.customer.name
        customerEmailLabel.text = vm.customer.email
        customerPhoneNumberLabel.text = vm.customer.phoneNumber
    }
}
