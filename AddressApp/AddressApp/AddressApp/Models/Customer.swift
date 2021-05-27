//
//  Customer.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import Foundation

struct Customer : Codable {
    var id: UUID? = nil
    let name: String
    let email: String
    let phoneNumber: String
    let companyID: Int
}
