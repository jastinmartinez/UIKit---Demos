//
//  RequestResource.swift
//  ProductApp
//
//  Created by Jastin on 31/5/21.
//

import Foundation
import Alamofire


final class RequestBuilder {
    
    func prepare(url: String) -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.headers = HTTPHeaders([.contentType("application/json")])
        urlRequest.method = .get
        return urlRequest
    }
}
