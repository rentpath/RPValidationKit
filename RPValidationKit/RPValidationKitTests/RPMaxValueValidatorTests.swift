//
//  RPMaxValueValidatorTests.swift
//  RPValidationKit
//
//  Created by crebel on 8/26/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest

@testable import RPValidationKit

class RPMaxValueValidatorTests: XCTestCase {
    
    func testValidationPassesForValidValue() {
        let validator = RPMaxValueValidator(string: "10")
        XCTAssertTrue(validator.validate("5"))
    }
    
    func testValidationFailsForInvalidValue() {
        let validator = RPMaxValueValidator(maxValue: 10)
        XCTAssertFalse(validator.validate("20"))
    }
}
