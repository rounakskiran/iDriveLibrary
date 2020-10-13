//
//  MockNetworkClient.swift
//  iDriveLibrary
//
//  Created by Rounak S Kiran on 13/10/20.
//

import Foundation

class MockNetworkClient: NetworkManagerProtocol {
    func loadData(url: String, completion: @escaping (ServiceResponse) -> Void) {
        guard let jsonData = loadData() else {
            completion(.noData)
            return
        }
        completion(.fetchedData(StorageObject(jsonData)))
    }
    
    func loadData() -> Data? {
        let response = """
                        [
                            "firstElement",
                            "secondElement",
                            "thirdElement"
                        ]
                        """
        let data = Data(response.utf8)
        return data
    }
}
