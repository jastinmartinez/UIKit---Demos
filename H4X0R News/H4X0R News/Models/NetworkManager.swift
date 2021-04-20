//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Jastin Martinez on 3/9/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData()  {
        if let url = URL(string:"http://hn.algolia.com/api/v1/search?tags=front_page")
        {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if let _error = error {
                    print(_error)
                }
                if let _data = data
                {
                    let jsonDecoder = JSONDecoder()
                    
                    do{
                        let results =  try jsonDecoder.decode(Results.self, from: _data)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    }
                    catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}
