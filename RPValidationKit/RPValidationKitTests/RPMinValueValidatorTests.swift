//
//  RPMaxValueValidatorTests.swift
//  RPValidationKit
//
//  Created by crebel on 8/26/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest

@testable import RPValidationKit

class RPMinValueValidatorTests: XCTestCase {
    
    func testValidationPassesForValidValue() {
        let validator = RPMinValueValidator(string: "10")
        XCTAssertTrue(validator.validate("12"))
    }
    
    func testValidationFailsForInvalidValue() {
        let validator = RPMinValueValidator(minValue: 10)
        XCTAssertFalse(validator.validate("4"))
    }
}
