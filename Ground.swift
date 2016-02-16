//
//  Ground.swift
//  Ball bounce
//
//  Created by Darvydas on 16/02/16.
//  Copyright © 2016 Darvydas. All rights reserved.
//

import Foundation
import SpriteKit

class Ground: SKSpriteNode {
    
    init(mainScene: SKNode) {
        
        super.init(texture: nil, color: UIColor.greenColor(), size: CGSizeMake(mainScene.frame.size.width , mainScene.frame.size.height / 10))
        position = CGPointMake(mainScene.frame.size.width / 2, frame.size.height / 2)
        zPosition = 50
        
        physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
        physicsBody?.categoryBitMask = kCategoryGround
        physicsBody?.restitution = 0.0
        physicsBody?.dynamic = false
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
