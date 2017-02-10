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

class RPMaxValueValidatorTests: XCTestCase {
    
    func testValidationPassesForValidValue() {
        let validator = RPMaxValueValidator(string: "10")
        XCTAssertTrue(validator.validate("5"))
    }
    
    func testValidationFailsForInvalidValue() {
        let validator = RPMaxValueValidator(maxValue: 10)
        XCTAssertFalse(validator.validate("20"))
    }
    
    func testCreateValidatorFromStringVariantOne() {
        let validator = RPValidatorFactory.sharedInstance.createValidator("maxvalue : 10")
        XCTAssertTrue(validator.validate("4"))
        XCTAssertFalse(validator.validate("20"))
    }
    
    func testCreateValidatorFromStringVariantTwo() {
        let validator = RPValidatorFactory.sharedInstance.createValidator("maxvalue: 10")
        XCTAssertTrue(validator.validate("4"))
        XCTAssertFalse(validator.validate("20"))
    }
    
    func testCreateValidatorFromStringVariantThree() {
        let validator = RPValidatorFactory.sharedInstance.createValidator("maxvalue :10")
        XCTAssertTrue(validator.validate("4"))
        XCTAssertFalse(validator.validate("20"))
    }
}
