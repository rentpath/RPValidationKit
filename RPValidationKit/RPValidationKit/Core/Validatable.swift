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

public protocol Validatable: AnyObject {
    
    func validate() -> ValidationResult
}


private final class Box<T>: NSObject {
    let value: T
    
    init(value: T) {
        self.value = value
    }
}

private var validatableNameKey: UInt8 = 0
private var validatorsKey: UInt8 = 0

extension Validatable {
    
    public var isValid: Bool {
        return self.validate().isValid
    }
    
    public var validatableName: String {
        get {
            return objc_getAssociatedObject(self, &validatableNameKey) as? String ?? "?"
        }
        set(newValue) {
            objc_setAssociatedObject(self, &validatableNameKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var validators: [Validator] {
        get {
            guard let box = objc_getAssociatedObject(self, &validatorsKey) as? Box<[Validator]> else {
                return []
            }
            return box.value ?? []
        }
        set(newValue) {
            let box = Box<[Validator]>(value: newValue)
            objc_setAssociatedObject(self, &validatorsKey, box, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
