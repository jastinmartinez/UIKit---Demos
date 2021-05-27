//
//  IPostResource.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import Foundation

struct IPostResource<T: Codable> {
    var url: URLRequest
    var model: [T]
    var jsonToModel: (Data) -> [T?]
}
