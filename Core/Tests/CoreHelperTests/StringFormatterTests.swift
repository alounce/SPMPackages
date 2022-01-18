//
//  StringFormatterTests.swift
//  
//
//  Created by Oleksa on 1/17/22.
//

import XCTest
@testable import CoreHelpers

class StringFormatterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStringFromMoney() throws {
        let string = StringFormatter.stringFromMoney(22)
        XCTAssertEqual(string, "22.00 $")
    }
    
    func testStringFromMoneyNegative() throws {
        let string = StringFormatter.stringFromMoney(-22)
        XCTAssertEqual(string, "-22.00 $")
    }

}
