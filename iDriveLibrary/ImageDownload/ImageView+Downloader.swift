//
//  ImageView+Downloader.swift
//  iDriveLibrary
//
//  Created by Rounak S Kiran on 12/10/20.
//

import UIKit

extension UIImageView {
    public func setImage(url: String) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        if let cachedData = CacheStorage.shared.retreiveFromCache(key: url) as? StorageObject {
            DispatchQueue.main.async {
                self.image = UIImage(data: cachedData.value)
            }
        } else {
            let queue = OperationQueue()
            queue.name = "com.idrive.download"
            queue.qualityOfService = .userInteractive
            queue.maxConcurrentOperationCount = 5
            if let operations = (queue.operations as? [ImageDownloadOperation])?.filter({ $0.imageUrl.absoluteString == url && !$0.isFinished && $0.isExecuting}), let operation = operations.first {
                operation.queuePriority = .high
            } else {
                let operation = ImageDownloadOperation(imageUrl: imageUrl)
                operation.downloadCompletion = { [weak self] data in
                    DispatchQueue.main.async {
                        self?.image = UIImage(data: data)
                    }
                }
                queue.addOperation(operation)
            }
        }
    }
}
