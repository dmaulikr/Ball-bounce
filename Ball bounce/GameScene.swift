//
//  GameScene.swift
//  Ball bounce
//
//  Created by Darvydas on 16/02/16.
//  Copyright (c) 2016 Darvydas. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        
        
        createInitialScene()
    }

    func createInitialScene() {
        
        let ball = Ball(mainScene: self, ballPosition: CGPointMake(frame.size.width / 2, frame.size.height / 4))
        addChild(ball)
        
        let ball2 = Ball(mainScene: self, ballPosition: CGPointMake(frame.size.width / 4, frame.size.height / 4))
        addChild(ball2)
        
        let ball3 = Ball(mainScene: self, ballPosition: CGPointMake(frame.size.width / 4 * 3, frame.size.height / 4))
        addChild(ball3)
        
        let ground = Ground(mainScene: self)
        addChild(ground)
        
        let bounds = Bounds(mainScene: self)
        addChild(bounds)
        
        let cup = Cup(mainScene: self, cupPosition: CGPointMake(frame.size.width / 2, frame.size.height / 2), cupZRotation: 0)
        addChild(cup)
        
        let cup2 = Cup(mainScene: self, cupPosition: CGPointMake(frame.size.width / 4, frame.size.height / 4), cupZRotation: CGFloat(-M_PI / 4))
        addChild(cup2)
        
    }
}
