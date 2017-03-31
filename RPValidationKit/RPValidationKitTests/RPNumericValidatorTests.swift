//
//  NumericValidatorTests.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/13/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest

@testable import RPValidationKit

class RPNumericValidatorTests: XCTestCase {

    func testValidationPassesForIntegerValues() {
        let validator = RPNumbericValidator()
        XCTAssertTrue(validator.validate("12345"))
    }
    
    func testValidationPassesForFloatValues() {
        let validator = RPNumbericValidator()
        XCTAssertTrue(validator.validate("12345.1"))
    }
    
    func testValidationPassesForDoubleValues() {
        let validator = RPNumbericValidator()
        XCTAssertTrue(validator.validate("12.12345891234"))
    }
    
    func testValidationFails() {
        let validator = RPNumbericValidator()
        XCTAssertFalse(validator.validate("not a number"))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
