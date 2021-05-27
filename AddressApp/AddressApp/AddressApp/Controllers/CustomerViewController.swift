//
//  CustomerViewController.swift
//  AddressApp
//
//  Created by Jastin on 27/5/21.
//

import UIKit

class CustomerViewController: UIViewController , NotifyCustomerView {
    
    func didCustomerChange() {
        customerTableView.reloadData()
    }
    
    @IBOutlet weak var customerTableView: UITableView!
    let customerViewModel = CustomerViewModels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customerTableView.dataSource = self
        self.customerTableView.delegate = self
        self.customerViewModel.delegate = self
        customerViewModel.getCustomersBySelectedCompany(at: DbHelper().getTemporalKey(.Company) as! Int)
        customerTableView.reloadData()
    }
}
