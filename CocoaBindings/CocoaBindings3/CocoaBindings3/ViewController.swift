// 
//  ViewController.swift
//  CocoaBindings3
//
//  Created by Mitsuhiro Daimon on 2019/09/03.
//  All rights reserved.
//
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet weak var tableView: NSTableView!
    
    var data: [[Contents]] = [
        [Contents("a"), Contents("b"), Contents("c", color: .systemRed)],
        [Contents("d", color: .systemRed), Contents("e"), Contents("f")],
        [Contents("g"), Contents("h", color: .systemYellow), Contents("i")],
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableColumns.forEach {
            tableView.removeTableColumn($0)
        }
        
        tableView.floatsGroupRows = false
        
        (0..<data[0].count).forEach {
            
            let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("\($0)"))
            column.title = "Column\($0)"
            tableView.addTableColumn(column)
        }

    }
    
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        
        return data.count
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        
        let textField = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTextField ?? NSTextField()
        
        textField.stringValue = data[row][Int(tableColumn!.identifier.rawValue)!].value
        textField.backgroundColor = data[row][Int(tableColumn!.identifier.rawValue)!].color
        textField.action = #selector(didEdit)
        textField.cell?.sendsActionOnEndEditing = true
        return textField
    }
    
    
    @IBAction func didEdit(_ sender: NSTextField) {
        
        let row = tableView.row(for: sender)
        let col = tableView.column(for: sender)
        
        data[row][col].value = sender.stringValue
        sender.backgroundColor = nil
    }
    
    
    
    @IBAction func show(_ sender: Any) {
        
        print(data)
    }
    
}



struct Contents: CustomDebugStringConvertible {
    var value: String
    var color: NSColor
    
    init(_ value: String, color: NSColor = .controlBackgroundColor) {
        self.value = value
        self.color = color
    }
    
    
    var debugDescription: String {
        return value
    }
}
