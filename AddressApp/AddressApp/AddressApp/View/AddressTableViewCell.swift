//
//  AddressTableViewCell.swift
//  AddressApp
//
//  Created by Jastin on 27/5/21.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet weak var streetAddressLabel: UILabel!
    @IBOutlet weak var apartmentAddressLabel: UILabel!
    @IBOutlet weak var cityAddressLabel: UILabel!
    @IBOutlet weak var stateAddressLabel: UILabel!
  
    func setValueToOutlest(_ vm: AddressViewModel ) {
        streetAddressLabel.text = vm.address.street
        apartmentAddressLabel.text = vm.address.suiteApartment
        stateAddressLabel.text = vm.address.state
        cityAddressLabel.text = vm.address.city
    }
}

