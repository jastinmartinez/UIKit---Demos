//
//  APIService.swift
//  AddressApp
//
//  Created by Jastin on 26/5/21.
//

import Foundation
import Alamofire

final class APIService {
    
    private let headers = HTTPHeaders([.contentType("application/json")])
    
    func postRquest<T>(resource: IPostResource<T>,completion: @escaping ([T?]) -> ()) {
        var resource = resource
        resource.url.headers = headers
        resource.url.httpBody = try? JSONEncoder().encode(resource.model)
        resource.url.method = .post
        AF.request(resource.url).responseJSON{ json in
            if let data = json.data {
                completion(resource.jsonToModel(data))
            }
        }
    }
    
    func getRequest<T>(resource: IGetResource<T>,completion: @escaping ([T?]) -> ()) {
        var resource = resource
        resource.url.headers = headers
        resource.url.method = .get
        AF.request(resource.url).responseJSON{ json in
            if let data = json.data {
                completion(resource.jsonToModel(data))
            }
        }
    }
}

