//
//  IPostResource.swift
//  ECommerce
//
//  Created by Jastin on 26/5/21.
//

import Foundation
import Alamofire
struct IPostResource<T : Codable> {
    let url: String
    let model: T
    let data: (Data) -> T?
}
