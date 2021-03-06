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

open class RPMinLengthValidator: RPValidator {
    
    open var minLength: Int = 1
    
    open override func getType() -> String {
        return "minlength"
    }
    
    public override init(string: String? = nil) {
        guard let _string = string, let length = Int(_string) else {
            return
        }
        minLength = length
    }
    
    public init(minLength: Int) {
        self.minLength = minLength
    }

    open override func validate(_ value: String) -> Bool {
        return value.count >= minLength
    }
    
    open override func validateField(_ fieldName: String, value: String) -> RPValidation {
        if validate(value) {
            return RPValidation.valid
        } else {
            return RPValidation.error(message: "\(fieldName) is too short")
        }
    }
}
