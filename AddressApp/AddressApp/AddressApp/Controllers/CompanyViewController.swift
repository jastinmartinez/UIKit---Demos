//
//  CompanyViewController.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import UIKit

class CompanyViewController: UIViewController {
    
    @IBOutlet weak var companyCollectionView: UICollectionView!
    let companyViewModel = CompanyViewModel()
    let customerViewModel = CustomerViewModels()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.companyCollectionView.dataSource = self
        self.companyCollectionView.delegate = self
    }
}
