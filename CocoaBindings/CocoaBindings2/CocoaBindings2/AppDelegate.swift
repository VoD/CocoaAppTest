//
//  AppDelegate.swift
//  CocoaBindings2
//
//  Created by 大門光寛 on 2019/01/13.
//  Copyright © 2019 MDaimon. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    
    func applicationWillFinishLaunching(_ notification: Notification) {
        ValueTransformer.setValueTransformer(SomeValueTransformer(), forName: NSValueTransformerName("SomeValueTransformer"))
    }


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

