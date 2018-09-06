//
//  ViewController.swift
//  ResizableView1
//
//  Created by 大門光寛 on 2018/09/07.
//  Copyright © 2018年 tetsuryokukai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let resizableView = ResizableView(frame: NSRect(x: 50, y: 100, width: 100, height: 50))
        self.view.addSubview(resizableView)
    }
}

