//
//  EnemyBear.swift
//  PlayerMovement
//
//  Created by Michelle Angela Aryanto on 22/06/24.
//

import SpriteKit

class EnemyBear: SKSpriteNode {
    
    init() {
        // Load the image from your asset catalog
        let texture = SKTexture(imageNamed: "Bear") // Replace "playerImage" with the name of your image asset
        let desiredSize = CGSize(width: 100, height: 100) // Adjust as needed

        
        // Initialize the sprite node with the texture
        super.init(texture: texture, color: .clear, size: desiredSize)
        
        // Set up physics body if needed
        physicsBody = SKPhysicsBody(texture: texture, size: desiredSize)
        physicsBody?.allowsRotation = false
        physicsBody?.affectedByGravity = false
        position = CGPoint(x: 40, y: 100)

        
        // Set other properties as needed
        name = "enemyBear"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

