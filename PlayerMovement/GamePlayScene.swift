//
//  GamePlayScene.swift
//  PlayerMovement
//
//  Created by Michelle Angela Aryanto on 11/06/24.
//

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
    var enemy = Enemy(size: CGSize(width: 100, height: 100))
    
    override required init(size: CGSize) {
        super.init(size: size)
    }
    
    @available(*, unavailable)
    required init(coder aDecoder: NSCoder) {
        fatalError("Not used!")
    }
    
    // scene view appearance
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.blue
        addChild(gameBorder)
        gameBorder.addChild(player)
        gameBorder.addChild(enemy)
        player.addChild(coneShape)
        
        // Position the cone shape relative to the player
        coneShape.position = CGPoint(x: player.frame.width / 2, y: 0) // Adjust position as needed
        enemy.position = CGPoint(x: 400, y: 0)
        // Start the initial movement
        
        movePlayer()
//        bumpEnemy()
        
        // Set up physics bodies for collision detection
//        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        coneShape.physicsBody = SKPhysicsBody(rectangleOf: coneShape.path!.boundingBox.size)

        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)

        // Manually position the collision area

        // Set the category bit masks for collision detection
//        player.physicsBody?.categoryBitMask = 1
        coneShape.physicsBody?.categoryBitMask = 1
        enemy.physicsBody?.categoryBitMask = 4

        // Set the contact test bit masks
//        player.physicsBody?.contactTestBitMask = 2
        coneShape.physicsBody?.contactTestBitMask = 5 // Collides with player (1) and enemy (4)
        enemy.physicsBody?.contactTestBitMask = 5

        // Set the collision bit masks
//        player.physicsBody?.collisionBitMask = 0
        coneShape.physicsBody?.collisionBitMask = 0
        enemy.physicsBody?.collisionBitMask = 0
        
        // Ensure that contact notifications are still sent
//        coneShape.physicsBody?.contactTestBitMask = enemy.physicsBody!.categoryBitMask
//        enemy.physicsBody?.contactTestBitMask = coneShape.physicsBody!.categoryBitMask
        
        // Prevent objects from falling over
//        player.physicsBody?.affectedByGravity = false
        coneShape.physicsBody?.affectedByGravity = false
        enemy.physicsBody?.affectedByGravity = false

        // Assign the scene as the physics world's contact delegate
        physicsWorld.contactDelegate = self
        
        view.showsPhysics = false
    }
    
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
        if collision == 5 { // Player and enemy collision
            backgroundColor = SKColor.yellow
            print("Game Over")
            
            // Stop the enemy's movement
            enemy.removeAllActions()
            coneShape.removeAllActions()
            player.removeAllActions()
            // the real logic
        }
    }
}
