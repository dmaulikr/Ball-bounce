//
//  Bounds.swift
//  Ball bounce
//
//  Created by Darvydas on 16/02/16.
//  Copyright © 2016 Darvydas. All rights reserved.
//

import Foundation
import SpriteKit

class Bounds: SKSpriteNode {
    
    var world: SKNode!
    
    init(mainScene: SKNode) {
        
        world = mainScene
        
        super.init(texture: nil, color: UIColor.clearColor(), size: world.frame.size)
        position = CGPointMake(world.frame.size.width / 2, world.frame.size.height / 2)
        
        createBounds()
    }
    
    func createBounds() {
        
        let left = SKSpriteNode(texture: nil, color: UIColor.redColor(), size: CGSizeMake(frame.size.width / 32, frame.size.height))
        left.position = CGPointMake(-frame.size.width / 2, 0)
        
        left.physicsBody = SKPhysicsBody(rectangleOfSize: left.size)
        left.physicsBody?.categoryBitMask = kCategoryGround
        left.physicsBody?.dynamic = false
        
        addChild(left)
        
        let right = SKSpriteNode(texture: nil, color: UIColor.redColor(), size: CGSizeMake(frame.size.width / 32, frame.size.height))
        right.position = CGPointMake(frame.size.width / 2, 0)
        
        right.physicsBody = SKPhysicsBody(rectangleOfSize: right.size)
        right.physicsBody?.categoryBitMask = kCategoryGround
        right.physicsBody?.dynamic = false
        
        addChild(right)
        
        let up = SKSpriteNode(texture: nil, color: UIColor.redColor(), size: CGSizeMake(frame.size.width, frame.size.width / 32))
        up.position = CGPointMake(0, frame.size.height / 2)
        
        up.physicsBody = SKPhysicsBody(rectangleOfSize: up.size)
        up.physicsBody?.categoryBitMask = kCategoryGround
        up.physicsBody?.dynamic = false
        
        addChild(up)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
