//
//  EndpointTests.swift
//  
//
//  Created by Oleksa on 1/18/22.
//

import XCTest
@testable import Networking

class EndpointTests: XCTestCase {

    func testInitialier() throws {
        let expectedBaseURL = "https://my-json-server.typicode.com/alounce/demo"
        let expectedPath = "products"
        let expectedQueryName = "id"
        let expectedQueryValue = "33"
        let queryItem = URLQueryItem(name: expectedQueryName, value: expectedQueryValue)
        let endopint = Endpoint(path: expectedPath, query: [queryItem])
        XCTAssertEqual(expectedPath, endopint.path)
        XCTAssertEqual([queryItem], endopint.query)
        XCTAssertEqual("\(expectedBaseURL)/\(expectedPath)?\(expectedQueryName)=\(expectedQueryValue)", endopint.url.absoluteString)
        XCTAssertEqual(1, endopint.headers.count)
        XCTAssertEqual("application/json", endopint.headers["Content-Type"] as? String)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
