//
//  ImageTableViewCell.swift
//  prefetching
//
//  Created by Jastin Martínez on 5/11/22.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var robotLogoImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setLogoImageView(_ data: Data? = nil) {
        DispatchQueue.main.async {
            if let data = data {
                self.robotLogoImageView.image = UIImage(data: data)
            }
        }
    }
}
