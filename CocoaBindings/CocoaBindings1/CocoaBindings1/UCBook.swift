//
//  UCBook.swift
//  CocoaBindings1
//
//  Created by 大門光寛 on 2019/01/06.
//  Copyright © 2019 MDaimon. All rights reserved.
//

import Cocoa

class UCBook: NSObject {
    @objc dynamic var title: String
    @objc dynamic var author: String
    @objc dynamic var comment: String
    
    override init() {
        self.title = "Untitle"
        self.author = "Unknown"
        self.comment = ""
        super.init()
    }
}
