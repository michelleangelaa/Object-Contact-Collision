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
        let texture = SKTexture(imageNamed: "Bear") // Replace "Bear" with the name of your image asset
        let originalSize = texture.size()
        let scaledSize = CGSize(width: originalSize.width * 2, height: originalSize.height * 2)
        
        // Initialize the sprite node with the texture
        super.init(texture: texture, color: .clear, size: scaledSize)
        self.setScale(2)
        
        // Set up physics body
        let physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        physicsBody.isDynamic = false // Set to true if you want it to interact with other dynamic bodies
        self.physicsBody = physicsBody
        
       
        // Set other properties as needed
        name = "enemyBear"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// In your GameScene or wherever you are adding the enemy bear
class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let enemyBear = EnemyBear()
        enemyBear.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(enemyBear)
    }
}
