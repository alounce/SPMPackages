//
//  StringFormatterTests.swift
//  
//
//  Created by Oleksa on 1/17/22.
//

import XCTest
@testable import CoreHelpers

class StringFormatterTests: XCTestCase {

    func testStringFromMoney() throws {
        let string = StringFormatter.stringFromMoney(22)
        XCTAssertEqual(string, "$22.00")
    }
    
    func testStringFromMoneyNegative() throws {
        let string = StringFormatter.stringFromMoney(-22)
        XCTAssertEqual(string, "-$22.00")
    }

}
