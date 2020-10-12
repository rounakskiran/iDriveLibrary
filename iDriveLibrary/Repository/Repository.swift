//
//  Repository.swift
//  iDrivePinterest
//
//  Created by Rounak S Kiran on 11/10/20.
//

import Foundation

public class Repository {
    public init() {}
    public func fetchData<T>(url: String, decodingType: T.Type, completion: @escaping (T?) -> Void) where T : Decodable {
        if let cachedData = CacheStorage.shared.retreiveFromCache(key: url) as? StorageObject {
            completion(decode(decodingType, from: cachedData.value))
        } else {
            fetchFromNetwork(url: url) { (serviceResponse) in
                if case let .fetchedData(storageObject) = serviceResponse {
                    CacheStorage.shared.insertToCache(key: url, content: storageObject)
                    completion(self.decode(decodingType, from: storageObject.value))
                }
            }
        }
    }
    
    private func fetchFromNetwork(url: String, completion: @escaping (ServiceResponse) -> Void) {
        NetworkClient().loadData(url: url) { (serviceResponse) in
            completion(serviceResponse)
        }
    }
    
    private func decode<T>(_ type: T.Type, from data: Data) -> T? where T : Decodable {
        do {
            let decoder = JSONDecoder()
            let decodedModel = try decoder.decode(T.self, from: data)
            return decodedModel
        } catch {
            return nil
        }
    }
}
