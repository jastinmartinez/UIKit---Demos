//
//  Contact.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import Foundation
import UIKit


struct Contact {
    
    let id: String
    
    let firstName: String
    
    let lastName: String?
    
    let phoneNumber: String
    
    let picture: UIImage
    
    let email: String?
    
    let phoneType: (type:PhoneType,index:Int)
    
    let emailType: (type:EmailType,index:Int)
    
}
