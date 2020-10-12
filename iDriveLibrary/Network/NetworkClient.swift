//
//  NetworkClient.swift
//  iDrivePinterest
//
//  Created by Rounak S Kiran on 10/10/20.
//

import Foundation

internal class NetworkClient {
    func loadData(url: String, completion: @escaping (ServiceResponse) -> Void) {
        guard let url = URL(string: url) else {
            completion(.noData)
            return
        }
        let datatask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.error(error))
            } else if let data = data {
                completion(.fetchedData(StorageObject(data)))
            } else {
                completion(.noData)
            }
        }
        datatask.resume()
    }
    
    func downloadImage(url: URL, completion: @escaping (ServiceResponse) -> Void) {
        let downloadTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.error(error))
            } else if let data = data {
                completion(.fetchedData(StorageObject(data)))
            } else {
                completion(.noData)
            }
        }
        downloadTask.resume()
    }
}
