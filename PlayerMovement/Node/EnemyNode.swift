//
//  EnemyNode.swift
//  PlayerMovement
//
//  Created by Michelle Angela Aryanto on 22/06/24.
//

import SpriteKit

class EnemyNode: SKNode {
    override init() {
        super.init()
        
        // add the guard image
        let sprite = SKSpriteNode(imageNamed: "Bear")
        sprite.position = CGPoint(x: 20, y: 20)
        sprite.setScale(2)
        
        // call the vision range
        let range = CameraRange()
        range.position = CGPoint(x: 2, y: -33)
        
        // add enemy path
        let path = EnemyPath()
        path.position = CGPoint(x: 20, y: 20)
        
        // create trail path
//        let path = UIBezierPath()
//        let radius: CGFloat = 50.0
//        let rect = CGRect(x: -100, y: -100, width: 200, height: 200)
//        path.addArc(withCenter: CGPoint(x: rect.minX + radius, y: rect.minY + radius), radius: radius, startAngle: CGFloat.pi, endAngle: CGFloat.pi / 2, clockwise: false)
//        path.addArc(withCenter: CGPoint(x: rect.maxX - radius, y: rect.minY + radius), radius: radius, startAngle: CGFloat.pi / 2, endAngle: 0, clockwise: false)
//        path.addArc(withCenter: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius), radius: radius, startAngle: 0, endAngle: -CGFloat.pi / 2, clockwise: false)
//        path.addArc(withCenter: CGPoint(x: rect.minX + radius, y: rect.maxY - radius), radius: radius, startAngle: -CGFloat.pi / 2, endAngle: -CGFloat.pi, clockwise: false)
//        path.close()
        
        // Create the red path visualization
//        let pathNode = SKShapeNode(path: path.cgPath)
//        pathNode.strokeColor = .red
//        pathNode.lineWidth = 2
             
        // appearance
//        self.addChild(sprite)
        self.addChild(path)
        path.addChild(sprite)
        sprite.addChild(range)
        
        // positioning
        // Define a path for the node to move along in a square trail
        let moveRight = SKAction.moveBy(x: 200, y: 0, duration: 2)
        let moveUp = SKAction.moveBy(x: 0, y: 200, duration: 2)
        let moveLeft = SKAction.moveBy(x: -200, y: 0, duration: 2)
        let moveDown = SKAction.moveBy(x: 0, y: -200, duration: 2)
        
        // Define actions to flip the sprite
//        let flipHorizontallyRight = SKAction.run {
//            self.xScale *= -1
//        }
//        let flipHorizontallyLeft = SKAction.run {
//            self.xScale *= -1
//        }
////        
        let flipHorizontallyRight = SKAction.run { sprite.xScale = -2.0}
        let flipHorizontallyLeft = SKAction.run { sprite.xScale = 2.0}
        
         
        // Create a sequence of actions with flipping included
        let sequence = SKAction.sequence([
            moveLeft,
            moveUp,
            flipHorizontallyRight,
            moveRight,
            moveDown,
            flipHorizontallyLeft
        ])
        
        if sequence == flipHorizontallyRight {
            range.xScale = -1.0
            range.physicsBody?.node?.xScale = -1.0

        }

        let repeatForever = SKAction.repeatForever(sequence)
        
        // Run the action on the node
        sprite.run(repeatForever)
        
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
