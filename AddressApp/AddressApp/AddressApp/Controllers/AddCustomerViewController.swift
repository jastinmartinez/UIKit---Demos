//
//  CustomerViewController.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import UIKit

class AddCustomerViewController: UIViewController {
    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var addCustumerTableView: UITableView!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var customerPhoneNumberTextField: UITextField!
    @IBOutlet weak var phoneNumberErrorLabel: UILabel!
    @IBOutlet weak var customerNameTextField: UITextField!
    @IBOutlet weak var customerEmailTextField: UITextField!
    
    
    let customerViewModel = CustomerViewModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addCustumerTableView.dataSource = self
        self.addCustumerTableView.delegate = self
        self.customerViewModel.delegate = self
        self.initiateValidationEvents()
    }
    
    
    @IBAction func addCustomerButtonPressed(_ sender: Any) {
        isInputValidationComplete { isComplete in
            if (isComplete)
            {
            customerViewModel.addTemporalCustomer(CustomerViewModel(customer: Customer(name: customerNameTextField.text!, email: customerEmailTextField.text!, phoneNumber: customerPhoneNumberTextField.text!, companyID: DbHelper().getTemporalKey(.Company) as! Int )))
            }
        }
    }
    @IBAction func saveCustomerButtonPressed(_ sender: Any) {
        
        isInputValidationComplete { isComplete in
            if (isComplete)
            {
                customerViewModel.saveOnDatabase()
            }
            else if self.customerViewModel.customerTemporaryViewModel.count < 1 {
                
                customerViewModel.addTemporalCustomer(CustomerViewModel(customer: Customer(name: customerNameTextField.text!, email: customerEmailTextField.text!, phoneNumber: customerPhoneNumberTextField.text!, companyID: DbHelper().getTemporalKey(.Company) as! Int)))
               
                customerViewModel.saveOnDatabase()
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
}


