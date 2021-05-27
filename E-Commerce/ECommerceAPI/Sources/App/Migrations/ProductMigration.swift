//
//  File.swift
//  
//
//  Created by Jastin on 25/5/21.
//


import Fluent

extension Product {
    struct Migration: Fluent.Migration {
    
        func prepare(on database: Database) -> EventLoopFuture<Void> {
             database.schema("product")
                .id()
                .field("product_description",.string,.required)
                .field("product_price",.double,.required)
                .create()
        }
        
        func revert(on database: Database) -> EventLoopFuture<Void> {
            database.schema("product").delete()
        }
    }
}
