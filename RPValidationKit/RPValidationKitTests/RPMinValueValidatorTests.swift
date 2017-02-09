//
//  RPMaxValueValidatorTests.swift
//  RPValidationKit
//
//  Created by crebel on 8/26/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest

#if os(iOS)
    @testable import RPValidationKit
#else
    @testable import RPValidationKitTV
#endif

class RPMinValueValidatorTests: XCTestCase {
    
    func testValidationPassesForValidValue() {
        let validator = RPMinValueValidator(string: "10")
        XCTAssertTrue(validator.validate("12"))
    }
    
    func testValidationFailsForInvalidValue() {
        let validator = RPMinValueValidator(minValue: 10)
        XCTAssertFalse(validator.validate("4"))
    }
    
    func testCreateValidatorFromString() {
        let validator = RPValidatorFactory.sharedInstance.createValidator("minvalue:10")
        XCTAssertTrue(validator.validate("20"))
        XCTAssertFalse(validator.validate("5"))
    }
}
