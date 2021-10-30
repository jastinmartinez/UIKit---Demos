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
        DispatchQueue.init(label: "com.load.images",qos: .userInteractive).async {
            self.bindImage(image: vm.img) { dataImage in
                let image = UIImage(data: dataImage!)
                DispatchQueue.main.async {
                    self.productImgImage.image = image
                }
            }
        }
    }
    func bindImage(image: String,completion:(Data?) -> ()) {
        guard let imageUrl = URL(string: image) else {return}
        let image = try? Data(contentsOf: imageUrl)
        completion(image)
    }
}
