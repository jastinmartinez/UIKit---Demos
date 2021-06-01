//
//  ProductTableViewCell.swift
//  ProductApp
//
//  Created by Jastin on 31/5/21.
//

import UIKit


class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productIDLabel: UILabel!
    
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    @IBOutlet weak var productMarkerLabel: UILabel!
    
    @IBOutlet weak var productImgImage: UIImageView!
    
    /// BindOutlets with product presenter data
    /// - Parameter vm: vm is  the instance of  model
    func bindProductToOutlets(vm: Product) {
        self.productIDLabel.text = vm.Id
        self.productDescriptionLabel.text = vm.Description
        self.productMarkerLabel.text = vm.Maker
        
        DispatchQueue.global(qos: .background).async {
            let dataImage = try? Data(contentsOf: URL(string: vm.img)!)
            let image = UIImage(data: dataImage!)
            DispatchQueue.main.async {
                self.productImgImage.image = image
            }
        }
    }
}
