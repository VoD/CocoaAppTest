//
//  ViewController.swift
//  KeyValueObservation1
//
//  Created by 大門光寛 on 2019/05/28.
//  Copyright © 2019 a. All rights reserved.
//

import Cocoa


final class ViewController: NSViewController {

    
    private var observation: [NSKeyValueObservation] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.representedObject = Model()
        
        self.observation.append((self.representedObject as! Model).observe(\.master) { (object, _) in
            print("observation 1+2")
            print(object.value1)
            print(object.value2)
            print(object.value4)
        })
        self.observation.append((self.representedObject as! Model).observe(\.value1) {
            (object, _) in
            print("observation 1")
            print(object.value1)
        })
        self.observation.append((self.representedObject as! Model).observe(\.value2) {
            (object, _) in
            print("observation 2")
            print(object.value2)
        })

    }
}

