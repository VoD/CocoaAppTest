//
//  ViewController.swift
//  CocoaBindings2
//
//  Created by 大門光寛 on 2019/01/13.
//  Copyright © 2019 MDaimon. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    @objc dynamic var list = ["A", "B", "C", "D"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.representedObject = Model()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func show(_ sender: Any) {
        
        print((self.representedObject as! Model).description)
        
//        print(self.arrayCon.arrangedObjects as! [NSString])
    }
    
}

