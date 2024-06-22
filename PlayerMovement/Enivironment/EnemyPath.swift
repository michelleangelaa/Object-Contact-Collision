//
//  EnemyPath.swift
//  PlayerMovement
//
//  Created by Michelle Angela Aryanto on 22/06/24.
//

import SpriteKit

class EnemyPath: SKNode {
    
    override init() {
        super.init()
        
        // Define the radius of the circles
        let radius: CGFloat = 20.0
        
        // Define the size of the square
        let squareSize: CGFloat = 200.0
        
        // Create four circles and position them at the edges of the square
        for i in 0..<4 {
            let circle = SKShapeNode(circleOfRadius: radius)
            circle.fillColor = .red
            circle.strokeColor = .clear
            
            // Calculate the position of each circle
            var position = CGPoint.zero
            switch i {
            case 0:
                position = CGPoint(x: -squareSize / 2, y: squareSize / 2) // Top-left corner
            case 1:
                position = CGPoint(x: squareSize / 2, y: squareSize / 2) // Top-right corner
            case 2:
                position = CGPoint(x: squareSize / 2, y: -squareSize / 2) // Bottom-right corner
            case 3:
                position = CGPoint(x: -squareSize / 2, y: -squareSize / 2) // Bottom-left corner
            default:
                break
            }
            
            // Position the circle at the calculated position
            circle.position = position
            
            // Add the circle to the parent node
            addChild(circle)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

