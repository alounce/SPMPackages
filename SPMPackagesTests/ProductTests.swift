//
//  ProductTests.swift
//  SPMPackagesTests
//
//  Created by Oleksa on 8/28/22.
//

import XCTest
@testable import SPMPackages

class ProductTests: XCTestCase {

    func test_product_init() throws {
        let sut = Product(id: 1, title: "Test", details: "Test details", price: 9)
        XCTAssertEqual(sut.id, 1)
        XCTAssertEqual(sut.title, "Test")
        XCTAssertEqual(sut.details, "Test details")
        XCTAssertEqual(sut.price, 9)
    }

}
