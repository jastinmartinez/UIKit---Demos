//
//  APIService.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import Foundation

final class APIService: APIServiceProtocol {
    
    func getAvatar(name: String, completion: @escaping (Data) -> ()) {
        
        let optionalUrl = URL(string: Constants.urls.avatarUrl(name: name))
    
        guard let url = optionalUrl else { return }
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
            
                completion(data)
            }
            
        }.resume()
    }
}

