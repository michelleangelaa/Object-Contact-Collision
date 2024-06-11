//
//  GamePlayScene.swift
//  PlayerMovement
//
//  Created by Michelle Angela Aryanto on 11/06/24.
//

import SpriteKit

import SpriteKit

class GamePlayScene: SKScene {
    
    var gameBorder = GameBorder()
//    var player = Player()
    var player = PlayerFox()
    
    var moveRight = true // Flag to track the direction of movement
    let moveDuration: TimeInterval = 2.0 // Duration for each movement
    let moveDistance: CGFloat = 100 // Distance to move
    
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
        
        // Start the initial movement
        movePlayer()
    }
    
    override func update(_ currentTime: TimeInterval) {
        // No need for movement in update method when using actions
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
}
