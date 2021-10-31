//
//  AddContactViewController.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import UIKit

class ContactCreateViewController: UIViewController {
    
    
    @IBOutlet weak var contactPictureImageView: UIImageView!
    @IBOutlet weak var contactFirstNameTextField: UITextField!
    @IBOutlet weak var contactSecondNameTextField: UITextField!
    @IBOutlet weak var contactPhoneTextField: UITextField!
    @IBOutlet weak var contactPhoneTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var contactEmailTextField: UITextField!
    @IBOutlet weak var contactEmailTypeSegmentedControl: UISegmentedControl!
    
    var contactPresenter: ContactsPresenter?
    
    private var contactTypes:(phoneType: PhoneType,emailType: EmailType) = (.Mobile,.Home)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        contactPresenter?.contactCloseViewDelegate = self
        prepareTextFieldsTargets()
        contactPictureImageView.rounded()
    }
    
    @IBAction func contactCreateSavedButtonPressed(_ sender: Any) {
        
        requiredFields { (firstName, phoneNumber) in
            
            contactPresenter?.addContact(Contact(id: UUID().uuidString, firstName: firstName, secondeName: contactSecondNameTextField.text, picture: contactPictureImageView.image!, email: contactEmailTextField.text, phoneType: contactTypes.phoneType, emailType: contactTypes.emailType))
        }
    }
    
    @IBAction func contactDeleteButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func phoneTypeSegmentedControlValueChanged(_ sender: Any) {
        
        if let phone =  contactPhoneTypeSegmentedControl.titleForSegment(at: contactPhoneTypeSegmentedControl.selectedSegmentIndex)   {
            
            if let phoneType = PhoneType.init(rawValue: phone) {
                
                contactTypes.phoneType = phoneType
            }
        }
    }
    
    @IBAction func emailTypeSegumentedControlValueChanged(_ sender: Any) {
        
        if let email =  contactEmailTypeSegmentedControl.titleForSegment(at: contactEmailTypeSegmentedControl.selectedSegmentIndex)   {
            
            if let emailType = EmailType.init(rawValue: email) {
                
                contactTypes.emailType = emailType
            }
        }
    }
}
