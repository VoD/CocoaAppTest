//
//  Model.swift
//  KeyValueObservation1
//
//  Created by 大門光寛 on 2019/05/28.
//  Copyright © 2019 a. All rights reserved.
//

import Cocoa


final class Model: NSObject {
    
    @objc dynamic var master: Any?
    
    @objc dynamic var value1: Int
    @objc dynamic var value2: String
    @objc private dynamic var value3: [NSMutableDictionary]
    @objc dynamic var value4: NSMutableArray = []
    
    override init() {
        
        self.value1 = 0
        self.value2 = "foo"
        self.value3 = [["name": "foo"], ["name": "var"]]
        super.init()
        self.value4 = self.mutableArrayValue(forKeyPath: #keyPath(value3))
    }
    
    
    
    @objc class func keyPathsForValuesAffectingMaster() -> Set<String> {
        
        return Set([#keyPath(value1), #keyPath(value2), #keyPath(value4)])
    }
}
