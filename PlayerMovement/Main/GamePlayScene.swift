//
//  GamePlayScene.swift
//  PlayerMovement
//
//  Created by Michelle Angela Aryanto on 11/06/24.
//

import SpriteKit
import SwiftUI

class GamePlayScene: SKScene, SKPhysicsContactDelegate {
    var gameBorder = GameBorder()
    var arrow = Arrow()
    var enemyGuard = EnemyBear()
    var bear = Bear()
    var player = Enemy(size: CGSize(width: 100, height: 100))
    var protector = Protector(size: CGSize(width: 20, height: 100))
    var range = CameraRange()
    var moveRight = true // Flag to track the direction of movement
    let moveSpeed: CGFloat = 100

    let moveDuration: TimeInterval = 2.0 // Duration for each movement
    let moveDistance: CGFloat = 100 // Distance to move
    var coneShape = ConeShape()
    var enemy = Enemy(size: CGSize(width: 100, height: 100))
    let guardSquareTrack = EnemyNode()
    
    
    override required init(size: CGSize) {
        super.init(size: size)
    }
    
    @available(*, unavailable)
    required init(coder aDecoder: NSCoder) {
        fatalError("Not used!")
    }
    
    // scene view appearance
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(Color.theme.floorColor)
        addChild(gameBorder)
        addChild(guardSquareTrack)
//        addChild(bear)
//        addChild(enemy)
        gameBorder.addChild(player)
        gameBorder.addChild(protector)
//        gameBorder.addChild(enemy)
        gameBorder.addChild(arrow)
        gameBorder.addChild(range)
        player.addChild(coneShape)
        
        // Position the cone shape relative to the player
        range.position = CGPoint(x: 520, y: 0)
        coneShape.position = CGPoint(x: player.size.width / 2 + coneShape.frame.width / 2, y: 0) // Adjust position as needed
        protector.position = CGPoint(x: 350, y: 0)
//        enemy.position = CGPoint(x: 400, y: 0)
        enemy.position = CGPoint(x: 100, y: 50)
        player.position = CGPoint(x: coneShape.frame.width / 2, y: 0)
        protector.zPosition = enemy.zPosition + 1
        guardSquareTrack.position = CGPoint(x: 400, y: 40)
//        bear.position = CGPoint(x: 500, y: 400)

        
        movePlayer()
        
        // Set up physics bodies for collision detection
        let enemyPhysicsSize = CGSize(width: enemy.size.width, height: enemy.size.height)

//        coneShape.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100), center: CGPoint(x: 50, y: 50))
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemyPhysicsSize, center: CGPoint(x: enemyPhysicsSize.width/2, y: enemyPhysicsSize.height/2))
        protector.physicsBody = SKPhysicsBody(rectangleOf: protector.size, center: CGPoint(x:protector.size.width/2, y: protector.size.height/2))
        enemyGuard.physicsBody = SKPhysicsBody(rectangleOf: enemyPhysicsSize, center: CGPoint(x: enemyPhysicsSize.width/2, y: enemyPhysicsSize.height/2))
        
        // Manually position the collision area

        // Set the category bit masks for collision detection
        protector.physicsBody?.categoryBitMask = 8
        coneShape.physicsBody?.categoryBitMask = 1
        enemy.physicsBody?.categoryBitMask = 4

        // Set the contact test bit masks
//        player.physicsBody?.contactTestBitMask = 2
        
        coneShape.physicsBody?.contactTestBitMask = 5 // Collides with player (1) and enemy (4)
        enemy.physicsBody?.contactTestBitMask = 5
        enemyGuard.physicsBody?.contactTestBitMask = 5

        // Set the collision bit masks
        protector.physicsBody?.collisionBitMask = 0
        coneShape.physicsBody?.collisionBitMask = 0
        enemy.physicsBody?.collisionBitMask = 0
        
        // Ensure that contact notifications are still sent
//        coneShape.physicsBody?.contactTestBitMask = enemy.physicsBody!.categoryBitMask
//        enemy.physicsBody?.contactTestBitMask = coneShape.physicsBody!.categoryBitMask
        
        // Prevent objects from falling over
        protector.physicsBody?.affectedByGravity = false
        coneShape.physicsBody?.affectedByGravity = false
        enemy.physicsBody?.affectedByGravity = false
//        enemyGuard.physicsBody?.affectedByGravity = false
        

        // Assign the scene as the physics world's contact delegate
        physicsWorld.contactDelegate = self
        
        // hide box indicator
//        view.showsPhysics = false
    }
    
        func movePlayer() {
            // Calculate the target position based on the direction
            let targetX = moveRight ? protector.position.x - 200:  player.frame.width / 2
    
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
    
//    func movePlayer() {
//        // Calculate the target position based on the direction
//        let targetX = coneShape.position.x + 200 < protector.position.x ? protector.position.x : size.width - coneShape.frame.width / 2
//
//        // Create an action to move the player to the target position
//        let moveAction = SKAction.move(to: CGPoint(x: targetX, y: player.position.y), duration: moveDuration)
//        
//        // Switch the direction for the next movement
//        moveRight = !moveRight
//        
//        // Calculate the duration based on the distance to move
//        let distance = abs(targetX - coneShape.position.x)
//        let duration = TimeInterval(distance / moveSpeed)
//        
//        // Call movePlayerBack again when the movement is complete to continue the back and forth motion
//        let completionAction = SKAction.run {
//            self.movePlayerBack()
//        }
//        
//        // Run the sequence of actions
//        player.run(SKAction.sequence([moveAction, completionAction]))
//    }
//    
//    func movePlayerBack() {
//        // Calculate the target position to move back to the left edge
//        let targetX = coneShape.position.x > protector.position.x ? protector.position.x : coneShape.frame.width / 2
//
//        // Calculate the duration based on the distance to move
//        let distance = abs(targetX - coneShape.position.x)
//        let duration = TimeInterval(distance / moveSpeed)
//        
//        // Create an action to move the player back to the left edge
//        let moveAction = SKAction.move(to: CGPoint(x: targetX, y: player.position.y), duration: duration)
//        
//        // Call movePlayer again when the movement is complete to continue the back and forth motion
//        let completionAction = SKAction.run {
//            self.movePlayer()
//        }
//        
//        // Run the sequence of actions
//        player.run(SKAction.sequence([moveAction, completionAction]))
//    }
//
//
    
//    func movePlayer() {
//        // Calculate the target position based on the direction
//        let targetX = player.position.x + 200 < protector.position.x ? protector.position.x : size.width - player.frame.width / 2
//        
//        // Calculate the duration based on the distance to move
//        let distance = abs(targetX - player.position.x + 200)
//        let duration = TimeInterval(distance / moveSpeed)
//        
//        // Create an action to move the player to the target position
//        let moveAction = SKAction.move(to: CGPoint(x: targetX, y: player.position.y), duration: duration)
//        
//        // Call movePlayerBack again when the movement is complete to continue the back and forth motion
//        let completionAction = SKAction.run {
//            self.movePlayerBack()
//        }
//        
//        // Run the sequence of actions
//        player.run(SKAction.sequence([moveAction, completionAction]))
//    }
//
//    func movePlayerBack() {
//        // Calculate the target position to move back to the left
//        let targetX = player.position.x + 200 > protector.position.x ? protector.position.x : player.frame.width / 2
//        
//        // Calculate the duration based on the distance to move
//        let distance = abs(player.position.x + 200 - targetX)
//        let duration = TimeInterval(distance / moveSpeed)
//        
//        // Create an action to move the player back to the left
//        let moveAction = SKAction.move(to: CGPoint(x: targetX, y: player.position.y), duration: duration)
//        
//        // Call movePlayer again when the movement is complete to continue the back and forth motion
//        let completionAction = SKAction.run {
//            self.movePlayer()
//        }
//        
//        // Run the sequence of actions
//        player.run(SKAction.sequence([moveAction, completionAction]))
//    }

    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if collision == 5 { // Player and enemy collision
            backgroundColor = SKColor.yellow
            print("Game Over")
            
            // Stop the enemy's movement
            enemy.removeAllActions()
            coneShape.removeAllActions()
            player.removeAllActions()
        }
    }
}
