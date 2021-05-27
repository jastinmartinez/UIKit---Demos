//
//  AddAddressViewController.swift
//  AddressApp
//
//  Created by Jastin on 27/5/21.
//

import UIKit

class AddAddressViewController: UIViewController {
    
    @IBOutlet weak var addAddressTableView: UITableView!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var apartmentAddressTextField: UITextField!
    @IBOutlet weak var cityAddressTextField: UITextField!
    @IBOutlet weak var stateAddressTextField: UITextField!
    
    let addAddressViewModel = AddressViewModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAddressViewModel.delegate = self
        self.addAddressTableView.delegate = self
        self.addAddressTableView.dataSource = self
    }
    
    @IBAction func addAddressButtonPressed(_ sender: Any) {
        addAddressViewModel.addTemporalAddresss(AddressViewModel(address: Address( street: streetAddressTextField.text!, city: cityAddressTextField.text!, suiteApartment: apartmentAddressTextField.text!, state: stateAddressTextField.text!, customerID:AddressParent(id: UUID(uuidString: DbHelper().getTemporalKey(.Address) as! String)!))))
    
    }
    @IBAction func saveAddressButtonPressed(_ sender: Any) {
        addAddressViewModel.saveOnDatabase()
    }
}
