//
//  ResizableView.swift
//  ResizableView1
//
//  Created by 大門光寛 on 2018/09/07.
//  Copyright © 2018年 tetsuryokukai. All rights reserved.
//

import Cocoa

// ドラッグでリサイズ可能な NSView のクラス
class ResizableView: NSView {
    
    let MAX_WIDTH: CGFloat = 300
    let MIN_WIDTH: CGFloat = 50
    var isResizeMode: Bool = false
    var draggableArea: NSRect!
    var trackingTag: TrackingRectTag?
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.updateDraggableArea()
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateDraggableArea() {
        
        // 古い領域を削除
        if let oldTag = self.trackingTag {
            self.removeTrackingRect(oldTag)
        }
        
        // 右端をドラッグ可能な領域に設定
        draggableArea = NSRect(x: self.frame.width - 10, y: 0, width: 10, height: self.frame.height)
        
        // mouseEntered の対象となる領域を設定
        self.trackingTag = self.addTrackingRect(draggableArea, owner: self, userData: nil, assumeInside: false)
    }
    
    override func mouseEntered(with event: NSEvent) {
        // ドラッグ可能領域内ではマウスカーソルを矢印に変更
        self.addCursorRect(draggableArea, cursor: NSCursor.resizeLeftRight)
    }
    
    override func mouseDown(with event: NSEvent) {
        // クリック位置の座標系を NSWindow からこの NSView に変換
        let clickPointInView = self.convert(event.locationInWindow, from: nil)
        print(clickPointInView)
        
        // クリック位置がドラッグ可能領域内だった場合
        if draggableArea.contains(clickPointInView) {
            print("resize mode start")
            isResizeMode = true
        }
    }
    
    override func mouseDragged(with event: NSEvent) {
        // ドラッグでサイズを変更
        if isResizeMode {
            self.frame.size.width = self.getWidth(self.frame.width + event.deltaX)
            self.updateDraggableArea()
        }
    }
    
    override func mouseUp(with event: NSEvent) {
        // リサイズ終了
        print("resize mode end")
        isResizeMode = false
        self.updateDraggableArea()
    }
    
    func getWidth(_ width: CGFloat) -> CGFloat {
        // 大きさの補正
        if width >= MAX_WIDTH {
            return MAX_WIDTH
        }
        
        if width <= MIN_WIDTH {
            return MIN_WIDTH
        }
        
        return width
    }
    
    override func acceptsFirstMouse(for event: NSEvent?) -> Bool {
        // ウィンドウが非アクティブ時にもクリックでマウスイベントを反応させる
        return true
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // 色付け
        NSColor.red.setFill()
        dirtyRect.fill()
        
        NSColor.orange.setFill()
        draggableArea.fill()
    }
}
