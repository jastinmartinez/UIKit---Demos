//
//  Address.swift
//  AddressApp
//
//  Created by Jastin on 27/5/21.
//

import Foundation
struct Address: Codable {
    var id: UUID? = nil
    var street: String
    var city: String
    var suiteApartment: String
    var state: String
    var customerID: AddressParent
}
struct AddressParent: Codable {
    var id: UUID
}
