//
//  ImageViewController.swift
//  prefetching
//
//  Created by Jastin Martínez on 5/11/22.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageTableView: UITableView!
    private let imagesRequest = Array(1...300)
    private let cellReuseIdentifier = "imageReusableIdentifier"
    private var imageOperationQueue = OperationQueue()
    private var loadingImageOperationQueue = [IndexPath: ImageOperation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.onCreate()
    }

    fileprivate func onCreate() {
        self.registerTableViewCell()
        self.setImageTableViewDataSource()
        self.setImageTableViewPrefetching()
        self.setImageTableViewDelegate()
    }

    fileprivate func registerTableViewCell() {
        self.imageTableView.register(UINib(nibName: String(describing: ImageTableViewCell.self), bundle: nil), forCellReuseIdentifier: self.cellReuseIdentifier)
    }

    fileprivate func setImageTableViewDataSource() {
        self.imageTableView.dataSource = self
    }

    fileprivate func setImageTableViewPrefetching() {
        self.imageTableView.prefetchDataSource = self
    }

    fileprivate func setImageTableViewDelegate() {
        self.imageTableView.delegate = self
    }

    fileprivate func removeImageOperation(_ indexPath: IndexPath) {
        if let imageOperation = self.loadingImageOperationQueue[indexPath] {
            imageOperation.cancel()
            self.loadingImageOperationQueue.removeValue(forKey: indexPath)
        }
    }

    fileprivate func addImageOperation(_ indexPath: IndexPath, result: ((Data) -> Void)? = nil) {
        let imageOperation = ImageOperation(index: indexPath.row)
        imageOperation.imageDataResult = result
        self.imageOperationQueue.addOperation(imageOperation)
        self.loadingImageOperationQueue[indexPath] = imageOperation
    }
}

extension ImageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.imagesRequest.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let imageCell = tableView.dequeueReusableCell(withIdentifier: self.cellReuseIdentifier, for: indexPath) as? ImageTableViewCell else  {
            return UITableViewCell()
        }
        imageCell.setLogoImageView(.none)
        return imageCell
    }
}

extension ImageViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            guard self.loadingImageOperationQueue[indexPath] == nil else {
                return
            }
            self.addImageOperation(indexPath)
        }
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            self.removeImageOperation(indexPath)
        }
    }
}

extension ImageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let imageCell = cell as? ImageTableViewCell else  {
            return
        }
        let updateResult: ((Data) -> Void)? = { [ unowned self]  imageData in
            imageCell.setLogoImageView(imageData)
            self.loadingImageOperationQueue.removeValue(forKey: indexPath)
        }

        if let operation = self.loadingImageOperationQueue[indexPath] {
            if let image = operation.getImageData() {
                imageCell.setLogoImageView(image)
                self.loadingImageOperationQueue.removeValue(forKey: indexPath)
            } else {
                operation.imageDataResult = updateResult
            }
        } else {
            self.addImageOperation(indexPath, result: updateResult)
        }
    }

    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.removeImageOperation(indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
