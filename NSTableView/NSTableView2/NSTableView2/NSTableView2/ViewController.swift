//
//  ViewController.swift
//  NSTableView2
//
//  Created by 大門光寛 on 2018/08/31.
//  Copyright © 2018年 tetsuryokukai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    
    var tableViewData = [["imageIcon":"NSUser","summaryInfo":"This is high level summary","descriptionInfo":"Some More Description","detailInfo":"Detailed Information"],["imageIcon":"NSUser","summaryInfo":"Product 2 - This is high level summary","descriptionInfo":"Some More Description","detailInfo":"Detailed Information"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ViewController: NSTableViewDataSource, NSTableViewDelegate {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let result:TableCellView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "defaultColumn"), owner: self) as! TableCellView
        
        print(tableViewData[row]["summaryInfo"])
        print(tableViewData[row]["descriptionInfo"])
        
        result.image.image = NSImage(named: "NSUser")
        result.largeLabel.stringValue = tableViewData[row]["summaryInfo"]!
        result.middleLabel.stringValue = tableViewData[row]["descriptionInfo"]!
        
        return result
    }
}


class TableCellView: NSTableCellView {
    
    @IBOutlet weak var middleLabel: NSTextField!
    @IBOutlet weak var image: NSImageView!
    @IBOutlet weak var largeLabel: NSTextField!
    
}
