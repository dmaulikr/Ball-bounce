//
//  Cup.swift
//  Ball bounce
//
//  Created by Darvydas on 16/02/16.
//  Copyright © 2016 Darvydas. All rights reserved.
//

import Foundation
import SpriteKit

class Cup: SKSpriteNode {
    
    var world: SKNode!
    
    init(mainScene: SKNode!, cupPosition: CGPoint, cupZRotation: CGFloat) {
        
        world = mainScene
        
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(world.frame.size.width / 16 * kSizeCup, world.frame.size.width / 12 * kSizeCup))
        position = cupPosition
        zRotation = cupZRotation
        zPosition = 100
        
        createCupFrame()
        createCupBackground()
    }
    
    func createCupBackground() {
        
        let cupBackgroundPath = CGPathCreateMutable()
        
        let cupBackground: SKShapeNode = SKShapeNode(path:cupBackgroundPath)
        
        CGPathMoveToPoint(cupBackgroundPath, nil, -size.width * 0.48125, size.height * 0.4375)
        CGPathAddLineToPoint(cupBackgroundPath, nil, -size.width * 0.35, -size.height / 2)
        CGPathAddLineToPoint(cupBackgroundPath, nil, size.width * 0.35, -size.height / 2)
        CGPathAddLineToPoint(cupBackgroundPath, nil, size.width * 0.48125, size.height * 0.4375)
        
        cupBackground.path = cupBackgroundPath
        cupBackground.strokeColor = UIColor.clearColor()
        cupBackground.fillColor = UIColor.whiteColor()
        cupBackground.alpha = 0.3
        cupBackground.lineWidth = frame.size.width / 32
                
        addChild(cupBackground)
        
    }
    
    func createCupFrame() {
        
        let cupFramePath = CGPathCreateMutable()
        
        let cupFrame: SKShapeNode = SKShapeNode(path:cupFramePath)
        
        CGPathMoveToPoint(cupFramePath, nil, -size.width * 0.5, size.height / 2)
        CGPathAddLineToPoint(cupFramePath, nil, -size.width * 0.35, -size.height / 2)
        CGPathAddLineToPoint(cupFramePath, nil, size.width * 0.35, -size.height / 2)
        CGPathAddLineToPoint(cupFramePath, nil, size.width * 0.5, size.height / 2)
        CGPathAddLineToPoint(cupFramePath, nil, size.width * 0.35, -size.height / 2)
        CGPathAddLineToPoint(cupFramePath, nil, -size.width * 0.35, -size.height / 2)
        CGPathMoveToPoint(cupFramePath, nil, -size.width * 0.5, size.height / 2)
        
        cupFrame.path = cupFramePath
        cupFrame.strokeColor = UIColor.whiteColor()
        cupFrame.lineWidth = frame.size.width / 32
        cupFrame.alpha = 0.7
        
        cupFrame.physicsBody = SKPhysicsBody(edgeLoopFromPath: cupFramePath)
        
        addChild(cupFrame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
