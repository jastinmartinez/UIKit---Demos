//
//  ImageDataSource.swift
//  prefetching
//
//  Created by Jastin Martínez on 5/11/22.
//

import Foundation

enum DataError: Error {
    case invalidURl
    case nilData
    case notAvailable(String)
    case invalidResponse
}

protocol ImageDataSourceProtocol {
    func getImage(from path: String, completion: @escaping (Result<Data, DataError>) -> Void)
}

final class ImageDataSource: ImageDataSourceProtocol {
    func getImage(from path: String, completion: @escaping (Result<Data, DataError>) -> Void) {
        guard let url = URL(string: path) else {
            completion(.failure(.invalidURl))
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                completion(.failure(.notAvailable(error.localizedDescription)))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.nilData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
