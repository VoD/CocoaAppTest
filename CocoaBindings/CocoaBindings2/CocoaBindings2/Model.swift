//
//  Model.swift
//  CocoaBindings2
//
//  Created by 大門光寛 on 2019/01/13.
//  Copyright © 2019 MDaimon. All rights reserved.
//

import Cocoa

final class Model: NSObject {
    @objc dynamic var value1: Int
    @objc dynamic var value2: Int
    @objc dynamic var value3: [NSMutableDictionary]
    @objc dynamic var value4: Int
    @objc dynamic var value5: Bool
    
    override init() {
        value1 = 0
        value2 = 0
        value3 = [["name": "foo"], ["name": "bar"]]
        value4 = 0
        value5 = true
        super.init()
    }
}


extension Model {
    
    override var description: String {
        
        return "Value1: \(value1), Value2: \(value2), Value3: \(value3.description), Value4: \(value4), Value5: \(value5)"
    }
}
