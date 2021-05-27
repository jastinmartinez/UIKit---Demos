//
//  CompanyCollectionReusableView.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import UIKit

class CompanyCollectionReusableView: UICollectionViewCell {
        
    @IBOutlet weak var companyDescriptionLabel: UILabel!
    @IBOutlet weak var companyImageImage: UIImageView!
    
    func setValueToOutlest(_ vm: Company) {
        companyImageImage.image = UIImage(named: vm.image)
        companyDescriptionLabel.text = vm.description
    }
}
