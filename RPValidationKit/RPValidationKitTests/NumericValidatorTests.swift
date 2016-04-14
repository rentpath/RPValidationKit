//
//  NumericValidatorTests.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/13/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest
@testable import RPValidationKit

class NumericValidatorTests: XCTestCase {

    func testValidationPassesForIntegerValues() {
        let validator = NumbericValidator()
        XCTAssertTrue(validator.validate("12345"))
    }
    
    func testValidationPassesForFloatValues() {
        let validator = NumbericValidator()
        XCTAssertTrue(validator.validate("12345.1"))
    }
    
    func testValidationPassesForDoubleValues() {
        let validator = NumbericValidator()
        XCTAssertTrue(validator.validate("12.12345891234"))
    }
    
    func testValidationFails() {
        let validator = NumbericValidator()
        XCTAssertFalse(validator.validate("not a number"))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
