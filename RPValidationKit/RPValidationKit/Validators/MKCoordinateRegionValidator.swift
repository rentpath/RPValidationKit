//
//  MKCoordinateRegionValidator.swift
//  RPValidationKit
//
//  Created by Jeremy Fox on 4/13/16.
//  Copyright © 2016 Rentpath. All rights reserved.
//

import MapKit
import CoreLocation

public struct MKCoordinateRegionValidator {
    
    private let MinLatitudeDelta  = 0.0
    private let MinLongitudeDelta = 0.0
    private let MinLatitude       = -90.0
    private let MaxLatitude       = 90.0
    private let MinLongitude      = -180.0
    private let MaxLongitude      = 180.0
    
    public func validate(region: MKCoordinateRegion) -> Bool {
        
        if (isnan(region.span.latitudeDelta)  ||
            isnan(region.span.longitudeDelta) ||
            isnan(region.center.latitude)     ||
            isnan(region.center.longitude)) {
            
            return false
        }
        
        if (region.span.latitudeDelta <= MinLatitudeDelta ||
            region.span.longitudeDelta <= MinLongitudeDelta) {
            
            return false
        }
        
        if (region.center.latitude > MaxLatitude   ||
            region.center.latitude < MinLatitude   ||
            region.center.longitude > MaxLongitude ||
            region.center.longitude < MinLongitude) {
            
            return false
        }
        
        return true
    }
    
}
