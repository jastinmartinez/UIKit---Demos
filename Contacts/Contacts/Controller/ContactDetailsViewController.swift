//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import UIKit

class ContactDetailsViewController: UIViewController {
   
    
    
    var contactPresenter:ContactsPresenter?
    
    @IBOutlet weak var contactPhoneTypeLabel: UILabel!
    @IBOutlet weak var contactLastNameLabel: UILabel!
    @IBOutlet weak var contactFirstNameLabel: UILabel!
    @IBOutlet weak var contactPhoneNumberLabel: UILabel!
    @IBOutlet weak var contactPictureImageView: UIImageView!
    @IBOutlet weak var contactEmailLabel: UILabel!
    @IBOutlet weak var contactEmailTypeLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        preparationOfContactDetail()
        contactPresenter?.contactPresenterProtocolNotifyDetailView = self
    }
    
    
     func preparationOfContactDetail() {
        
        self.contactFirstNameLabel.text = contactPresenter?.contact?.firstName
        self.contactPhoneNumberLabel.text = contactPresenter?.contact?.phoneNumber
        self.contactPhoneNumberLabel.phoneNumberFormat()
        self.contactLastNameLabel.text = contactPresenter?.contact?.lastName
        self.contactPictureImageView.image = contactPresenter?.contact?.picture
        self.contactPhoneTypeLabel.text = contactPresenter?.contact?.phoneType.type.rawValue
        self.contactEmailLabel.text = contactPresenter?.contact?.email
        self.contactEmailTypeLabel.text = contactPresenter?.contact?.emailType.type.rawValue
    }
    
    @IBAction func contactEdiButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: Constants.segues.contactEditViewController, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.segues.contactEditViewController {
            
            guard let contactCreateOrEditViewController = segue.destination as? ContactCreateOrEditViewController else { return }
            
            guard let contactPresenter = contactPresenter else { return }
            
            contactCreateOrEditViewController.contactPresenter.instance = contactPresenter
            contactCreateOrEditViewController.contactPresenter.type = .edit
        }
    }
}
