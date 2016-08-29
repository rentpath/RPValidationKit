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

import Foundation

public class RPEmailValidator: RPValidator {
    
    var EMAILREGEX = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$"
    
    public override func getType() -> String {
        return "email"
    }
    
    public override func validate(value: String) -> Bool {
        let components = value.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if components.count > 1 {
            return false
        }
        
        let range = value.rangeOfString(EMAILREGEX, options:.RegularExpressionSearch)
        return (range != nil) ? true : false
    }
    
    public override func validateField(fieldName: String, value: String) -> RPValidation {
        if validate(value) {
            return RPValidation.Valid
        } else {
            return RPValidation.Error(message: "\(fieldName) is not a valid email address")
        }
    }
}
