//
//  StreetAddressValidatorTests.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/14/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest

@testable import RPValidationKit

class RPStreetAddressValidatorTests: XCTestCase {

    func testValidationPassesForValidStreetAddressOne() {
        let validator = RPStreetAddressValidator()
        XCTAssertTrue(validator.validate("123 main st"))
    }
    
    func testValidationPassesForValidStreetAddressTwo() {
        let validator = RPStreetAddressValidator()
        XCTAssertTrue(validator.validate("123 Main Rd NE"))
    }
    
    func testValidationPassesForValidStreetAddressThree() {
        let validator = RPStreetAddressValidator()
        XCTAssertTrue(validator.validate("123 N Main Cir"))
    }
    
    func testValidationFailsForInvalidStreetAddressOne() {
        let validator = RPStreetAddressValidator()
        XCTAssertFalse(validator.validate("123main st"))
    }
    
    func testValidationFailsForInvalidStreetAddressTwo() {
        let validator = RPStreetAddressValidator()
        XCTAssertFalse(validator.validate("main st 123"))
    }
    
    func testValidationFailsForInvalidStreetAddressThree() {
        let validator = RPStreetAddressValidator()
        XCTAssertFalse(validator.validate("123"))
    }
    
    func testValidationFailsForInvalidStreetAddressFour() {
        let validator = RPStreetAddressValidator()
        XCTAssertFalse(validator.validate("main st"))
    }
    
    func testValidationFailsForEmptyStreetAddress() {
        let validator = RPStreetAddressValidator()
        XCTAssertFalse(validator.validate(""))
    }
    
    func testPerformanceExample() {
        let validator = RPStreetAddressValidator()
        self.measure {
            let _ = validator.validate("123 main st")
        }
    }

}
