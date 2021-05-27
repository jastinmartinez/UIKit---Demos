//
//  IGetResource.swift
//  ECommerce
//
//  Created by Jastin on 25/5/21.
//

import Foundation

struct IGetResource<T> {
    let url: String
    let data: (Data) -> T?
}
