//
//  IGetResource.swift
//  AddressApp
//
//  Created by Jastin on 27/5/21.
//

import Foundation
struct IGetResource<T : Encodable> {
    var url: URLRequest
    let jsonToModel: (Data) -> [T?]
}
