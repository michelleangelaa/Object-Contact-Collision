//
//  GameViewController.swift
//  PlayerMovement
//
//  Created by Michelle Angela Aryanto on 11/06/24.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GamePlayScene(size: CGSize(width: 640, height: 960))
        scene.scaleMode = .aspectFit
        let view = self.view as! SKView
        view.showsFPS = true
        view.showsPhysics = true
        view.showsNodeCount = true // how many sprites in scene
        view.presentScene(scene)
        
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
