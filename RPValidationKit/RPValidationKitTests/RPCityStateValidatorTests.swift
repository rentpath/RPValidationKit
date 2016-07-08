//
//  CityStateValidatorTests.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/14/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest
@testable import RPValidationKit

class RPCityStateValidatorTests: XCTestCase {

    func testValidationPassesForValidCityStateOne() {
        let validator = RPCityStateValidator()
        XCTAssertTrue(validator.validate("atlanta, ga"))
    }
    
    func testValidationPassesForValidCityStateTwo() {
        let validator = RPCityStateValidator()
        XCTAssertTrue(validator.validate("Atlanta, GA"))
    }
    
    func testValidationPassesForValidCityStateThree() {
        let validator = RPCityStateValidator()
        XCTAssertTrue(validator.validate("los angeles, ca"))
    }
    
    func testValidationFailsForInvalidCityStateOne() {
        let validator = RPCityStateValidator()
        XCTAssertFalse(validator.validate("atlanta ga"))
    }
    
    func testValidationFailsForInvalidCityStateTwo() {
        let validator = RPCityStateValidator()
        XCTAssertFalse(validator.validate("atlantaga"))
    }
    
    func testValidationFailsForEmptyCityStateOne() {
        let validator = RPCityStateValidator()
        XCTAssertFalse(validator.validate(" "))
    }
    
    func testValidationFailsForEmptyCityStateTwo() {
        let validator = RPCityStateValidator()
        XCTAssertFalse(validator.validate(""))
    }
    
    func testPerformanceExample() {
        let validator = RPCityStateValidator()
        self.measureBlock {
            validator.validate("123 main st")
        }
    }

}
