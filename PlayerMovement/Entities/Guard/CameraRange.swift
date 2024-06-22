//
//  CameraRange.swift
//  PlayerMovement
//
//  Created by Michelle Angela Aryanto on 22/06/24.
//

import SpriteKit
import SwiftUI

class CameraRange: SKShapeNode {
    override init() {
        super.init()
            
        // Define the points of the cone shape
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 50, y: 0)) // Bottom center
        path.addLine(to: CGPoint(x: 0, y: 100)) // Top left
        path.addArc(center: CGPoint(x: 50, y: 80), radius: 40, startAngle: .pi, endAngle: 0, clockwise: true) // Curved base
//             path.addLine(to: CGPoint(x: 80, y: 80)) // Top right
        path.closeSubpath()
        
//            let path = CGMutablePath()
//             path.move(to: CGPoint(x: 80, y: 0))    // Bottom center
//             path.addLine(to: CGPoint(x: 0, y: 160))  // Top left
//             path.addArc(center: CGPoint(x: 80, y: 160), radius: 80, startAngle: .pi, endAngle: 0, clockwise: true) // Curved base
//    //             path.addLine(to: CGPoint(x: 80, y: 80)) // Top right
//             path.closeSubpath()
        
        // Set the path and other properties
        self.path = path
        fillColor = UIColor(Color.theme.lightColor)
        strokeColor = SKColor.clear
        alpha = 0.8
        
        // Rotate the shape by 90 degrees
        zRotation = .pi / 2
        
        // Add physics body with the same shape
        let physicsBody = SKPhysicsBody(polygonFrom: path)
        physicsBody.isDynamic = false // Set to true if you want it to interact with other dynamic bodies
        self.physicsBody = physicsBody
                
        setScale(0.5)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
}
