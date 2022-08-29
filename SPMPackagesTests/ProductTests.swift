//
//  ProductTests.swift
//  SPMPackagesTests
//
//  Created by Oleksa on 8/28/22.
//

import XCTest
@testable import SPMPackages

class ProductTests: XCTestCase {
    
    var products = Products()
    let expectedProductID = 1
    let expectedProductTitle = "Test"
    let expectedProductDetails = "Test details"
    let expectedProductPrice = 9
    
    override func setUpWithError() throws {
        let first = Product(
            id: expectedProductID,
            title: expectedProductTitle,
            details: expectedProductDetails,
            price: expectedProductPrice
        )
        products.append(first)
    }

    func test_product_init() throws {
        let sut = products.first!
        XCTAssertEqual(sut.id, expectedProductID)
        XCTAssertEqual(sut.title, expectedProductTitle)
        XCTAssertEqual(sut.details, expectedProductDetails)
        XCTAssertEqual(sut.price, expectedProductPrice)
    }
    
    func test_product_codable() throws {
        let sut = products.first!
        let data = try JSONEncoder().encode(sut)
        let decoded = try JSONDecoder().decode(Product.self, from: data)
        XCTAssertEqual(decoded.id, expectedProductID)
        XCTAssertEqual(decoded.title, expectedProductTitle)
        XCTAssertEqual(decoded.details, expectedProductDetails)
        XCTAssertEqual(decoded.price, expectedProductPrice)
    }

}
