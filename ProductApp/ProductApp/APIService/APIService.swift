//
//  APIService.swift
//  ProductApp
//
//  Created by Jastin on 31/5/21.
//

import Foundation
import Alamofire

final class APIService {
    
    /// Request Handler
    /// - Parameters:
    ///   - url: should pass infomation from request like (method, body,url)
    ///   - completion: return the result of submited request
    /// - Returns: none
    func request(url: URLRequest, completion: @escaping(Data?,HTTPURLResponse?,AFError?) -> ())  {
        AF.request(url).response{completion($0.data,$0.response,$0.error)}
    }
}
