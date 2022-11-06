//
//  RobotImageDataRepository.swift
//  prefetching
//
//  Created by Jastin Martínez on 5/11/22.
//

import Foundation

final class RobotImageDataRepository {

    private let imageDataSourceProtocol: ImageDataSourceProtocol
    private let robotPath = "https://robohash.org/"

    required init(imagedataSourceProtocol: ImageDataSourceProtocol) {
        self.imageDataSourceProtocol = imagedataSourceProtocol
    }

    func getImage(for index: Int, completion: @escaping (Result<Data,DataError>) -> Void) {
        self.imageDataSourceProtocol.getImage(from: self.robotPath + "\(index).png", completion: completion)
    }
}
