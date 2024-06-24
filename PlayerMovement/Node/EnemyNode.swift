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
//        let sprite = SKSpriteNode(imageNamed: "Bear")
//        sprite.position = CGPoint(x: 20, y: 20)
//        sprite.setScale(2)
        
        let bear = EnemyBear()
        bear.position = CGPoint(x: 20, y: 20)
        self.setScale(2)
        
        // call the vision range
        let range = Light()
//        range.position = CGPoint(x: -20, y: 0)
        range.position = CGPoint(x: -3, y: 10)
        
        let bear2 = Bear()
        bear2.position = CGPoint(x: 20, y: 20)
//        bear2.anchorPoint = CGPoint(x: 0.7, y: 0.5)
        
        
        
        self.addChild(bear)
        self.addChild(range)
        self.addChild(bear2)
        
        // positioning
        // Define a path for the node to move along in a square trail
        let moveRight = SKAction.moveBy(x: 100, y: 0, duration: 2)
        let moveUp = SKAction.moveBy(x: 0, y: 100, duration: 2)
        let moveLeft = SKAction.moveBy(x: -100, y: 0, duration: 2)
        let moveDown = SKAction.moveBy(x: 0, y: -100, duration: 2)
        
        let moveRightLamp = SKAction.moveBy(x: 100, y: 0, duration: 2)
        let moveUpLamp = SKAction.moveBy(x: 0, y: 100, duration: 2)
        let moveLeftLamp = SKAction.moveBy(x: -100, y: 0, duration: 2)
        let moveDownLamp = SKAction.moveBy(x: 0, y: -100, duration: 2)
        
        // Define actions to flip the sprite
//        let flipHorizontallyRight = SKAction.run {
//            self.xScale *= -1
//        }
//        let flipHorizontallyLeft = SKAction.run {
//            self.xScale *= -1
//        }
////        
        
//        let flipHorizontallyRight = SKAction.run {
//                    let flipPoint = CGPoint(x: 50, y: 50) // Custom coordinate to flip around
//                    
//                    // Adjust anchor point based on the custom coordinate
//                    sprite.anchorPoint = CGPoint(x: flipPoint.x / sprite.size.width, y: flipPoint.y / sprite.size.height)
//                    
//                    // Flip the sprite
//                    sprite.xScale *= -1
//                    
//                    // Adjust the position to compensate for anchor point change
//                    sprite.position = CGPoint(x: sprite.position.x - (flipPoint.x - sprite.size.width / 2), y: sprite.position.y)
//        }
//        
//        let flipHorizontallyLeft = SKAction.run {
//                    let flipPoint = CGPoint(x: 50, y: 50) // Custom coordinate to flip around
//                    
//                    // Adjust anchor point based on the custom coordinate
//                    sprite.anchorPoint = CGPoint(x: flipPoint.x / sprite.size.width, y: flipPoint.y / sprite.size.height)
//                    
//                    // Flip the sprite
//                    sprite.xScale *= 1
//                    
//                    // Adjust the position to compensate for anchor point change
//                    sprite.position = CGPoint(x: sprite.position.x - (flipPoint.x - sprite.size.width / 2), y: sprite.position.y)
//        }
        
        let flipHorizontallyRight = SKAction.run { bear2.xScale = -1.0 }
        let flipHorizontallyLeft = SKAction.run { bear2.xScale = 1.0 }

//        let flipHorizontallyRight = SKAction.run { bear.xScale = -1.0 }
//        let flipHorizontallyLeft = SKAction.run { bear.xScale = 1.0 }
        
        let flipHorizontallyRightLamp = SKAction.run { range.xScale = -1.0}
        let flipHorizontallyLeftLamp = SKAction.run { range.xScale = 1.0 }
        
         
        // Create a sequence of actions with flipping included
        let sequence = SKAction.sequence([
            moveLeft,
            moveUp,
            flipHorizontallyRight,
            moveRight,
            moveDown,
            flipHorizontallyLeft
        ])
        
        let sequence2 = SKAction.sequence([
            moveLeftLamp,
            moveUpLamp,
            flipHorizontallyRightLamp,
            moveRightLamp,
            moveDownLamp,
            flipHorizontallyLeftLamp
        ])
        
//        if sequence == flipHorizontallyRight {
//            range.xScale = -1.0
//            range.physicsBody?.node?.xScale = -1.0
//
//        }

        let repeatForever = SKAction.repeatForever(sequence)
        let repeatForever2 = SKAction.repeatForever(sequence2)

        
        
        // Run the action on the node
        bear2.run(repeatForever)
//        bear.run(repeatForever)
        range.run(repeatForever2)
        
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
