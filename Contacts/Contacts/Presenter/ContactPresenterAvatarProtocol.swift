//
//  ContactProtocol.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import Foundation
import UIKit

protocol ContactPresenterAvatarProtocol {
    
    func generateAvatar(name: String,completion: @escaping (UIImage) -> ())
}
