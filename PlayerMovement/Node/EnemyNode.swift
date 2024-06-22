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
        
        // call the vision range
        let range = CameraRange()
        
        // the guard image
        let sprite = SKSpriteNode(imageNamed: "Bear")

        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
