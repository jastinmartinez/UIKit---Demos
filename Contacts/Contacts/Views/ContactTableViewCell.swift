//
//  ContactTableViewCell.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactLogoImageView: UIImageView!
    
    @IBOutlet weak var contactNameLabel: UILabel!
    
    @IBOutlet weak var contactPhoneType: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        contactLogoImageView.rounded()
        contactPhoneType.rounded()
    }
    
    func setTableViewValues(_ contact: Contact) {
        
        contactNameLabel.text = contact.name
        
        contactLogoImageView.image = contact.logo
    }
}
