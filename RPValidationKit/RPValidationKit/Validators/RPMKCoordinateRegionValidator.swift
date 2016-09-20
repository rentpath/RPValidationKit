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

open class RPMKCoordinateRegionValidator {
    
    fileprivate let MinLatitudeDelta  = 0.0
    fileprivate let MinLongitudeDelta = 0.0
    fileprivate let MinLatitude       = -90.0
    fileprivate let MaxLatitude       = 90.0
    fileprivate let MinLongitude      = -180.0
    fileprivate let MaxLongitude      = 180.0
    
    public init() { }
    
    open func validate(_ region: MKCoordinateRegion) -> Bool {
        
        if (region.span.latitudeDelta.isNaN  ||
            region.span.longitudeDelta.isNaN ||
            region.center.latitude.isNaN     ||
            region.center.longitude.isNaN) {
            
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
