//
//  ImageDownloadOperation.swift
//  iDriveLibrary
//
//  Created by Rounak S Kiran on 12/10/20.
//

import Foundation

class ImageDownloadOperation: Operation {
    typealias CompletionType = (Data) -> Void
    
    let imageUrl: URL
    var downloadCompletion: CompletionType?
    
    required init(imageUrl: URL) {
        self.imageUrl = imageUrl
    }
    
    override func main() {
        guard !isCancelled else {
            return
        }
        NetworkClient().downloadImage(url: imageUrl) { (serviceResponse) in
            guard !self.isCancelled else {
                return
            }
            if case let .fetchedData(storageObject) = serviceResponse {
                CacheStorage.shared.insertToCache(key: self.imageUrl.absoluteString, content: storageObject)
                self.downloadCompletion?(storageObject.value)
            }
        }
    }
}
