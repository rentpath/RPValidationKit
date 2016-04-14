//
//  StreetAddressValidatorTests.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/14/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest
@testable import RPValidationKit

class StreetAddressValidatorTests: XCTestCase {

    func testValidationPassesForValidStreetAddressOne() {
        let validator = StreetAddressValidator()
        XCTAssertTrue(validator.validate("123 main st"))
    }
    
    func testValidationPassesForValidStreetAddressTwo() {
        let validator = StreetAddressValidator()
        XCTAssertTrue(validator.validate("123 Main Rd NE"))
    }
    
    func testValidationPassesForValidStreetAddressThree() {
        let validator = StreetAddressValidator()
        XCTAssertTrue(validator.validate("123 N Main Cir"))
    }
    
    func testValidationFailsForInvalidStreetAddressOne() {
        let validator = StreetAddressValidator()
        XCTAssertFalse(validator.validate("123main st"))
    }
    
    func testValidationFailsForInvalidStreetAddressTwo() {
        let validator = StreetAddressValidator()
        XCTAssertFalse(validator.validate("main st 123"))
    }
    
    func testValidationFailsForInvalidStreetAddressThree() {
        let validator = StreetAddressValidator()
        XCTAssertFalse(validator.validate("123"))
    }
    
    func testValidationFailsForInvalidStreetAddressFour() {
        let validator = StreetAddressValidator()
        XCTAssertFalse(validator.validate("main st"))
    }
    
    func testValidationFailsForEmptyStreetAddress() {
        let validator = StreetAddressValidator()
        XCTAssertFalse(validator.validate(""))
    }
    
    func testPerformanceExample() {
        let validator = StreetAddressValidator()
        self.measureBlock {
            validator.validate("123 main st")
        }
    }

}
