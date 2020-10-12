//
//  ServiceResponse.swift
//  iDrivePinterest
//
//  Created by Rounak S Kiran on 11/10/20.
//

import Foundation

enum ServiceResponse {
    case fetchedData(StorageObject)
    case error(Error)
    case noData
}

class StorageObject {
    let value: Data
    init(_ value: Data) {
        self.value = value
    }
}
