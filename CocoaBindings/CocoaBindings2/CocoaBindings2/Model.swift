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
    @objc dynamic var value3: [String]
    @objc dynamic var value4: Int
    
    override init() {
        value1 = 0
        value2 = 0
        value3 = []
        value4 = 0
        super.init()
    }
}
