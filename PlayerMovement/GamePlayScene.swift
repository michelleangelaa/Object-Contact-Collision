//
//  GamePlayScene.swift
//  PlayerMovement
//
//  Created by Michelle Angela Aryanto on 11/06/24.
//

import SpriteKit

import SpriteKit

class GamePlayScene: SKScene, SKPhysicsContactDelegate {
    
    var gameBorder = GameBorder()
//    var player = Player()
    var player = PlayerFox()
    
    var moveRight = true // Flag to track the direction of movement
    let moveSpeed: CGFloat = 100

    let moveDuration: TimeInterval = 2.0 // Duration for each movement
    let moveDistance: CGFloat = 100 // Distance to move
    var coneShape = ConeShape()
    var enemy = Enemy()
    
    
    override required init(size: CGSize) {
        super.init(size: size)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("Not used!")
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.blue
        addChild(gameBorder)
        gameBorder.addChild(player)
        gameBorder.addChild(enemy)
        player.addChild(coneShape)
        

        
        // Position the cone shape relative to the player
        coneShape.position = CGPoint(x: player.frame.width / 2, y: 0) // Adjust position as needed
        enemy.position = CGPoint(x: 600, y: 0)
        // Start the initial movement
        
        

        movePlayer()
//        bumpEnemy()
        
        physicsWorld.contactDelegate = self

    }
    
//    override func update(_ currentTime: TimeInterval) {
//        // Move the player back and forth horizontally
//                let dx = moveSpeed * CGFloat(currentTime)
//                if moveRight {
//                    player.position.x += dx
//                    if player.position.x >= size.width - player.frame.width / 2 {
//                        player.position.x = size.width - player.frame.width / 2
//                        moveRight = false
//                    }
//                } else {
//                    player.position.x -= dx
//                    if player.position.x <= player.frame.width / 2 {
//                        player.position.x = player.frame.width / 2
//                        moveRight = true
//                    }
//                }
//                
//                // Update the position of the cone shape relative to the player
//                coneShape.position = CGPoint(x: 0, y: 0)
//                coneShape.zRotation = player.zRotation // Rotate the cone shape with the player
//    }
    
//    func bumpEnemy() {
//        let enemySize = CGSize(width: 40, height: 40) // Adjust as needed
//        // Set up physics bodies for collision detection
//        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
//        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemySize)
//        
//        // Set the category bit masks for collision detection
//        player.physicsBody?.categoryBitMask = 1
//        enemy.physicsBody?.categoryBitMask = 2
//        
//        // Set the contact test bit masks
//        player.physicsBody?.contactTestBitMask = 2
//        enemy.physicsBody?.contactTestBitMask = 1
//        
//        // Set the collision bit masks
//        player.physicsBody?.collisionBitMask = 0
//        enemy.physicsBody?.collisionBitMask = 0
//        
//        // Assign the scene as the physics world's contact delegate
//        physicsWorld.contactDelegate = self
//    }
//    
    func movePlayer() {
        // Calculate the target position based on the direction
        let targetX = moveRight ? size.width - player.frame.width / 2 : player.frame.width / 2
        
        // Create an action to move the player to the target position
        let moveAction = SKAction.move(to: CGPoint(x: targetX, y: player.position.y), duration: moveDuration)
        
        // Switch the direction for the next movement
        moveRight = !moveRight
        
        // Call movePlayer again when the movement is complete to continue the back and forth motion
        let completionAction = SKAction.run {
            self.movePlayer()
        }
        
        // Run the sequence of actions
        player.run(SKAction.sequence([moveAction, completionAction]))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if collision == 3 { // Player and enemy collision
            print("Game Over")
        }
    }
}
