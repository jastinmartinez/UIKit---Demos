//
//  File.swift
//  
//
//  Created by Jastin on 27/5/21.
//

import Fluent


extension Address {
    
    struct Migration: Fluent.Migration {
        
        func prepare(on database: Database) -> EventLoopFuture<Void> {
            database.schema("address")
                .id()
                .field("address_street",.string,.required)
                .field("address_city",.string,.required)
                .field("address_suite_apartment",.string,.required)
                .field("address_state",.string,.required)
                .field("customer_id",.uuid,.required,.references("customer", "id"))
                .create()
        }
        func revert(on database: Database) -> EventLoopFuture<Void> {
            database.schema("address").delete()
        }
    }
}
