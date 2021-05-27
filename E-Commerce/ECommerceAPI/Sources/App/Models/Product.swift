//
//  File.swift
//  
//
//  Created by Jastin on 25/5/21.
//

import Vapor
import Fluent

final class Product: ContentModel {
    
    static var schema: String = "product"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "product_description")
    var description: String
    
    @Field(key: "product_price")
    var price: Double

    
    
    init()  { }
    
    init(id: UUID? = nil, description: String, price: Double ) throws {
        self.id = id
        self.description = description
        self.price = price
    }
}
