//
//  Arrow.swift
//  PlayerMovement
//
//  Created by Michelle Angela Aryanto on 22/06/24.
//

import SpriteKit

class Arrow: SKShapeNode {
    
    override init() {
        super.init()
        createArrow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createArrow()
    }
    
    private func createArrow() {
        // Define the arrow path
        let arrowPath = CGMutablePath()
        arrowPath.move(to: CGPoint(x: -10, y: -10))
        arrowPath.addLine(to: CGPoint(x: 0, y: -40))
        arrowPath.addLine(to: CGPoint(x: 10, y: -10))
        arrowPath.addLine(to: CGPoint(x: 5, y: -10))
        arrowPath.addLine(to: CGPoint(x: 5, y: 20))
        arrowPath.addLine(to: CGPoint(x: -5, y: 20))
        arrowPath.addLine(to: CGPoint(x: -5, y: -10))
        arrowPath.addLine(to: CGPoint(x: -10, y: -10))
        arrowPath.closeSubpath()
        
        // Set the path for the shape node
        self.path = arrowPath
        self.fillColor = .brown
        self.strokeColor = .black
        self.lineWidth = 2
        
        // Set up the physics body
        self.physicsBody = SKPhysicsBody(polygonFrom: arrowPath)
        self.physicsBody?.isDynamic = true // Enable physical interactions
    }
}

