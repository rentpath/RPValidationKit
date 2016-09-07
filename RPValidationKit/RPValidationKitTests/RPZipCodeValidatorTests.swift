//
//  ZipCodeValidatorTests.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/14/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest
@testable import RPValidationKit

class RPZipCodeValidatorTests: XCTestCase {

    func testValidationPassesForValidZipCode() {
        let validator = RPZipCodeValidator()
        XCTAssertTrue(validator.validate("30019"))
    }
    
    func testValidationPassesForValidZipCodeTwo() {
        let validator = RPZipCodeValidator()
        XCTAssertTrue(validator.validate("30019-1234"))
    }
    
    func testValidationFailsForInvalidZipCodeOne() {
        let validator = RPZipCodeValidator()
        XCTAssertFalse(validator.validate("3001"))
    }
    
    func testValidationFailsForInvalidZipCodeTwo() {
        let validator = RPZipCodeValidator()
        XCTAssertFalse(validator.validate("300"))
    }
    
    func testValidationFailsForInvalidZipCodeThree() {
        let validator = RPZipCodeValidator()
        XCTAssertFalse(validator.validate("30"))
    }
    
    func testValidationFailsForInvalidZipCodeFour() {
        let validator = RPZipCodeValidator()
        XCTAssertFalse(validator.validate("3"))
    }
    
    func testValidationFailsForInvalidZipCodeFive() {
        let validator = RPZipCodeValidator()
        XCTAssertFalse(validator.validate("11111"))
    }
    
    func testValidationFailsForInvalidZipCodeSix() {
        let validator = RPZipCodeValidator()
        XCTAssertFalse(validator.validate(" "))
    }
    
    func testValidationFailsForInvalidZipCodeSeven() {
        let validator = RPZipCodeValidator()
        XCTAssertFalse(validator.validate(""))
    }
    
    func testPerformanceExample() {
        let validator = RPZipCodeValidator()
        self.measure {
            let _ = validator.validate("30019")
        }
    }

}
