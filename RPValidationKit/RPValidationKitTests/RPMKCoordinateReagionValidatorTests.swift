//
//  MKCoordinateReagionValidatorTests.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/13/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import XCTest
import MapKit

@testable import RPValidationKit

class RPMKCoordinateReagionValidatorTests: XCTestCase {
    
    func testValidationPasses() {
        let center = CLLocationCoordinate2D(latitude: 33.7490, longitude: -84.3880)
        let latDelta = CLLocationDegrees(floatLiteral: 500)
        let lngDelta = CLLocationDegrees(floatLiteral: 500)
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
        let region = MKCoordinateRegion(center: center, span: span)
        
        let validator = RPMKCoordinateRegionValidator()
        XCTAssertTrue(validator.validate(region))
    }
    
    func testValidationFailsWithBadLatitude() {
        let center = CLLocationCoordinate2D(latitude: 133.7490, longitude: -84.3880)
        let latDelta = CLLocationDegrees(floatLiteral: 500)
        let lngDelta = CLLocationDegrees(floatLiteral: 500)
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
        let region = MKCoordinateRegion(center: center, span: span)
        
        let validator = RPMKCoordinateRegionValidator()
        XCTAssertFalse(validator.validate(region))
    }
    
    func testValidationFailsWithBadLongitude() {
        let center = CLLocationCoordinate2D(latitude: 33.7490, longitude: -184.3880)
        let latDelta = CLLocationDegrees(floatLiteral: 500)
        let lngDelta = CLLocationDegrees(floatLiteral: 500)
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
        let region = MKCoordinateRegion(center: center, span: span)
        
        let validator = RPMKCoordinateRegionValidator()
        XCTAssertFalse(validator.validate(region))
    }
    
    func testValidationFailsWithBadLatitudeDelta() {
        let center = CLLocationCoordinate2D(latitude: 133.7490, longitude: -84.3880)
        let latDelta = CLLocationDegrees(floatLiteral: -500)
        let lngDelta = CLLocationDegrees(floatLiteral: 500)
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
        let region = MKCoordinateRegion(center: center, span: span)
        
        let validator = RPMKCoordinateRegionValidator()
        XCTAssertFalse(validator.validate(region))
    }
    
    func testValidationFailsWithBadLongitudeDelta() {
        let center = CLLocationCoordinate2D(latitude: 133.7490, longitude: -84.3880)
        let latDelta = CLLocationDegrees(floatLiteral: 500)
        let lngDelta = CLLocationDegrees(floatLiteral: -500)
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
        let region = MKCoordinateRegion(center: center, span: span)
        
        let validator = RPMKCoordinateRegionValidator()
        XCTAssertFalse(validator.validate(region))
    }

    func testValidationPerformance() {
        let center = CLLocationCoordinate2D(latitude: 133.7490, longitude: -84.3880)
        let latDelta = CLLocationDegrees(floatLiteral: 500)
        let lngDelta = CLLocationDegrees(floatLiteral: 500)
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
        let region = MKCoordinateRegion(center: center, span: span)
        
        let validator = RPMKCoordinateRegionValidator()

        self.measure {
            let _ = validator.validate(region)
        }
    }

}
