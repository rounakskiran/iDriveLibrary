//
//  NetworkManager.swift
//  iDriveLibrary
//
//  Created by Rounak S Kiran on 13/10/20.
//

import Foundation

public protocol NetworkManagerProtocol {
    func loadData(url: String, completion: @escaping (ServiceResponse) -> Void)
}

public class NetworkManager {
    private static var instance: NetworkManagerProtocol?
    private static var networkClient = NetworkClient()
    
    public static func sharedInstance() -> NetworkManagerProtocol {
        guard let instance = NetworkManager.instance else {
            NetworkManager.instance = NetworkManager.networkClient
            return NetworkManager.networkClient
        }
        return instance
    }
    
    public static func setNetworkClient(client: NetworkManagerProtocol) {
        NetworkManager.instance = client
    }
}
