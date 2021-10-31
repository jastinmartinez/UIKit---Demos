//
//  APIService.swift
//  Contacts
//
//  Created by Jastin on 30/10/21.
//

import Foundation


final class APIService: APIServiceProtocol {
    
    func getAvatar(name: String, completion: @escaping (Data) -> ()) {
        
        let optionalUrl = URL(string: "\(Constants.urls.avatarUrl + name + ".svg")")
        
        guard let url = optionalUrl else { return }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let data = data {
                
                DispatchQueue.main.async {
                    
                    completion(data)
                }
            }
        }.resume()
    }
}

