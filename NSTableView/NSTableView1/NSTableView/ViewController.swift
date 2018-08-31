//
//  ViewController.swift
//  NSTableView
//
//  Created by 大門光寛 on 2018/08/31.
//  Copyright © 2018年 tetsuryokukai. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    
    
    let tableViewData = [["firstName":"John","lastName":"Doe","emailId":"john.doe@knowstack.com"],["firstName":"Jane","lastName":"Doe","emailId":"jane.doe@knowstack.com"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self as? NSTableViewDelegate
        self.tableView.dataSource = self
    }
}

extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return tableViewData[row][(tableColumn?.identifier.rawValue)!]
    }
}
