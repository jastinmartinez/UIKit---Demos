//
//  ImageOperation.swift
//  prefetching
//
//  Created by Jastin Martínez on 6/11/22.
//

import Foundation

class ImageOperation: Operation {
    var imageDataResult: (((Data)) -> Void)? = nil
    private var imageData: Data? = nil
    private let robotImageDataRepository = RobotImageDataRepository(imagedataSourceProtocol: ImageDataSource())
    private var index: Int

    init(index: Int) {
        self.index = index
    }

    func getImageData() -> Data? {
        return self.imageData 
    }

    override func main() {
        if !isCancelled {
            self.robotImageDataRepository.getImage(for: self.index) { robotImageDataRepositoryResult in
                switch robotImageDataRepositoryResult {
                case .success(let imageData):
                    self.imageData = imageData
                    self.imageDataResult?(imageData)
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
}
