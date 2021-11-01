//
//  AddContactViewController.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import UIKit

class ContactCreateOrEditViewController: UIViewController {
    
    
    @IBOutlet weak var contactPictureImageView: UIImageView!
    @IBOutlet weak var contactFirstNameTextField: UITextField!
    @IBOutlet weak var contactLastNameTextField: UITextField!
    @IBOutlet weak var contactPhoneTextField: UITextField!
    @IBOutlet weak var contactPhoneTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var contactEmailTextField: UITextField!
    @IBOutlet weak var contactEmailTypeSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var contactDeleteButton: UIButton!
    
    var contactPresenter: (instance:ContactsPresenter,type:ActionInView) = (ContactsPresenter(),.create)
    
    
    private var contactTypes:(phoneType:(type: PhoneType,index: Int),emailType:(type: EmailType, index: Int)) = ((.Mobile,0),(.Home,0))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initViewDidload()
        
    }
    
    
    @IBAction func contactCreateSavedButtonPressed(_ sender: Any) {
        
        requiredFields { (firstName, phoneNumber) in
            
            let id = contactPresenter.type == .edit ? contactPresenter.instance.contact?.id ?? UUID().uuidString:  UUID().uuidString
            
            let contatc = Contact(id: id, firstName: firstName, lastName: contactLastNameTextField.text, phoneNumber: phoneNumber, picture: contactPictureImageView.image!, email: contactEmailTextField.text, phoneType: contactTypes.phoneType, emailType: contactTypes.emailType)
            
            if contactPresenter.type == .edit {
                
                contactPresenter.instance.editContact(contatc)
            }
            else {
                contactPresenter.instance.addContact(contatc)
            }
        }
    }
    
    @IBAction func contactDeleteButtonPressed(_ sender: Any) {
        if contactPresenter.type == .edit {
            
            contactPresenter.instance.removeContact()
        }
    }
    
    @IBAction func phoneTypeSegmentedControlValueChanged(_ sender: Any) {
        
        if let phone =  contactPhoneTypeSegmentedControl.titleForSegment(at: contactPhoneTypeSegmentedControl.selectedSegmentIndex)   {
            
            if let phoneType = PhoneType.init(rawValue: phone) {
                
                contactTypes.phoneType.type = phoneType
                contactTypes.phoneType.index = contactPhoneTypeSegmentedControl.selectedSegmentIndex
            }
        }
    }
    
    @IBAction func emailTypeSegumentedControlValueChanged(_ sender: Any) {
        
        if let email =  contactEmailTypeSegmentedControl.titleForSegment(at: contactEmailTypeSegmentedControl.selectedSegmentIndex)   {
            
            if let emailType = EmailType.init(rawValue: email) {
                
                contactTypes.emailType.type = emailType
                contactTypes.emailType.index = contactEmailTypeSegmentedControl.selectedSegmentIndex
            }
        }
    }
    
    private func initViewDidload() {
        
        if contactPresenter.type == .edit {
            contactDeleteButton.isHidden = false
            loadDataToFields()
        }
        else {
            contactDeleteButton.isHidden = true
        }
        contactPhoneTextField.delegate = self
        contactPresenter.instance.contactCloseViewDelegate = self
        prepareTextFieldsTargets()
        contactPictureImageView.rounded()
    }
    
    func loadDataToFields() {
        contactPictureImageView.image = contactPresenter.instance.contact?.picture
        contactFirstNameTextField.text =  contactPresenter.instance.contact?.firstName
        contactLastNameTextField.text = contactPresenter.instance.contact?.lastName
        contactPhoneTextField.text = contactPresenter.instance.contact?.phoneNumber
        contactPhoneTypeSegmentedControl.selectedSegmentIndex = contactPresenter.instance.contact?.phoneType.index ?? 0
        contactEmailTextField.text = contactPresenter.instance.contact?.email
        contactEmailTypeSegmentedControl.selectedSegmentIndex = contactPresenter.instance.contact?.emailType.index ?? 0
   }
}
