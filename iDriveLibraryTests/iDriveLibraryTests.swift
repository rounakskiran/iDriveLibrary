//
//  iDriveLibraryTests.swift
//  iDriveLibraryTests
//
//  Created by Rounak S Kiran on 12/10/20.
//

import XCTest
@testable import iDriveLibrary

class iDriveLibraryTests: XCTestCase {
    
    override class func setUp() {
        NetworkManager.setNetworkClient(client: MockNetworkClient())
    }

    func testfetchData() throws {
        Repository().fetchData(url: "", decodingType: [String].self) { (data) in
            XCTAssertNotNil(data)
            XCTAssertEqual(data?.count, 3)
        }
    }
}
