//
//  ZipCodeValidatorTests.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/14/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest
@testable import RPValidationKit

class ZipCodeValidatorTests: XCTestCase {

    func testValidationPassesForValidZipCode() {
        let validator = ZipCodeValidator()
        XCTAssertTrue(validator.validate("30019"))
    }
    
    func testValidationPassesForValidZipCodeTwo() {
        let validator = ZipCodeValidator()
        XCTAssertTrue(validator.validate("30019-1234"))
    }
    
    func testValidationFailsForInvalidZipCodeOne() {
        let validator = ZipCodeValidator()
        XCTAssertFalse(validator.validate("3001"))
    }
    
    func testValidationFailsForInvalidZipCodeTwo() {
        let validator = ZipCodeValidator()
        XCTAssertFalse(validator.validate("300"))
    }
    
    func testValidationFailsForInvalidZipCodeThree() {
        let validator = ZipCodeValidator()
        XCTAssertFalse(validator.validate("30"))
    }
    
    func testValidationFailsForInvalidZipCodeFour() {
        let validator = ZipCodeValidator()
        XCTAssertFalse(validator.validate("3"))
    }
    
    func testValidationFailsForInvalidZipCodeFive() {
        let validator = ZipCodeValidator()
        XCTAssertFalse(validator.validate("11111"))
    }
    
    func testValidationFailsForInvalidZipCodeSix() {
        let validator = ZipCodeValidator()
        XCTAssertFalse(validator.validate(" "))
    }
    
    func testValidationFailsForInvalidZipCodeSeven() {
        let validator = ZipCodeValidator()
        XCTAssertFalse(validator.validate(""))
    }
    
    func testPerformanceExample() {
        let validator = ZipCodeValidator()
        self.measureBlock {
            validator.validate("30019")
        }
    }

}
