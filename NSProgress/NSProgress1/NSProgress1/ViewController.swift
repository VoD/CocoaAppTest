//
//  ViewController.swift
//  NSProgress1
//
//  Created by 大門光寛 on 2019/03/05.
//  Copyright © 2019 tetsuryokukai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    @objc dynamic var progress: Progress?
    @IBOutlet weak var field: NSTextField!
    
    override func viewWillAppear() {
        super.viewWillAppear()
        self.progress = Progress(totalUnitCount: Int64(10))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    
    @IBAction func buttonPushed(_ sender: NSButton) {
        
        DispatchQueue.global().async {
            for i in 0..<10 {
                self.progress?.completedUnitCount += 1
//                DispatchQueue.main.async {
//                    self.field.doubleValue = self.progress!.fractionCompleted
//                }
                print(i+1)
                sleep(1)
            }
        }
    }
    

}

