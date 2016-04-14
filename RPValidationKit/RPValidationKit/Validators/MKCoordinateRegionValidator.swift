/*
 * Copyright (c) 2016 RentPath, LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import MapKit
import CoreLocation

public struct MKCoordinateRegionValidator {
    
    private let MinLatitudeDelta  = 0.0
    private let MinLongitudeDelta = 0.0
    private let MinLatitude       = -90.0
    private let MaxLatitude       = 90.0
    private let MinLongitude      = -180.0
    private let MaxLongitude      = 180.0
    
    public init() {}
    
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
