//
//  GameViewController.swift
//  Ball bounce
//
//  Created by Darvydas on 16/02/16.
//  Copyright (c) 2016 Darvydas. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the view
        
        let skView = view as! SKView
        skView.multipleTouchEnabled = false
        
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.showsPhysics = true
        
        // Create and configure the scene
        
        let scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        scene.size = skView.bounds.size
        
        skView.presentScene(scene);
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
