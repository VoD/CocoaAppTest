
//
//  SomeValueTransformer.swift
//  CocoaBindings2
//
//  Created by 大門光寛 on 2019/05/23.
//  Copyright © 2019 MDaimon. All rights reserved.
//

import Cocoa

@objc(SomeValueTransformer)
class SomeValueTransformer: ValueTransformer {
    
    override class func transformedValueClass() -> AnyClass {
        
        return NSString.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        
        return true
    }
    
    
    override func transformedValue(_ value: Any?) -> Any? {
        
        guard let tag = value as? Int else { return nil }
        
        switch tag {
        case 0:
            return "A" as NSString
        case 1:
            return "B" as NSString
        case 2:
            return "C" as NSString
        case 3:
            return "D" as NSString
        default:
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        
        guard let name = value as? String else { return nil }
        
        switch name {
        case "A":
            return 0
        case "B":
            return 1
        case "C":
            return 2
        case "D":
            return 3
        default:
            return nil
        }
    }
}
