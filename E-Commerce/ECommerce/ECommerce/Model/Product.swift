//
//  Product.swift
//  ECommerce
//
//  Created by Jastin on 26/5/21.
//

import Foundation
struct Product: Codable {
    let id: UUID?
    let description: String
    let price: Double
}
