//
//  CacheStorage.swift
//  iDrivePinterest
//
//  Created by Rounak S Kiran on 11/10/20.
//

import Foundation

class CacheStorage {
    public static let shared = CacheStorage()
    let storage = NSCache<NSString, AnyObject>()
    
    private init() {}
    
    func insertToCache<T: AnyObject>(key: String, content: T) {
        storage.setObject(content, forKey: key as NSString)
    }
    
    func retreiveFromCache(key: String) -> AnyObject? {
        if let cachedContent = storage.object(forKey: key as NSString) {
            return cachedContent
        }
        return nil
    }
}

extension CacheStorage: CacheConfigurable {
    public func setTotalCostLimit(_ limit: Int) {
        storage.totalCostLimit = limit
    }
}
