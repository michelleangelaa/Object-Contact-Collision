//
//  GameBorder2.swift
//  PlayerMovement
//
//  Created by Michelle Angela Aryanto on 22/06/24.
//

import SpriteKit

class GameBorder2 : SKShapeNode {
    
    override init() {
        super.init()
        let thePath = CGMutablePath()
        let rect = CGRect(x: 20, y: 0, width: 640, height: 100)
        thePath.addRect(rect)
        path = thePath
        strokeColor = SKColor.white
        lineWidth = 4.0
        position = CGPoint(x: 0, y: 480)
        name = "bounds"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not Used")
    }
}
