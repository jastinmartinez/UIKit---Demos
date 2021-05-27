//
//  IWebService.swift
//  ECommerce
//
//  Created by Jastin on 25/5/21.
//

import Foundation
import Alamofire

final class IWebService {
    
    private let headers = HTTPHeaders([.contentType("application/json")])
    
    func getRequest<T>(resource: IGetResource<T>,completion:@escaping (T?) -> ())  {
        AF.request(resource.url).responseJSON { json in
            if let data  = json.data {
                completion(resource.data(data))
            }
        }
    }
    
    func postRequest<T>(resource: IPostResource<T>,completion:@escaping (T?) -> ())  {
        
        let content = try? JSONSerialization.jsonObject(with: JSONEncoder().encode(resource.model.self)) as? [String: Any]

        AF.request(resource.url,method: .post   ,parameters: content ,encoding: JSONEncoding.default, headers: headers).responseJSON { json in
            if let data  = json.data {
                completion(resource.data(data))
            }
        }
    }
    
    func delRequest(resource: URL ,completion: @escaping (Bool?) -> ())  {
        
        AF.request(resource, method: .delete, headers: headers).responseJSON { json in
            if let data  = json.response {
                completion(data.statusCode == 200)
            }
        }
    }
}
