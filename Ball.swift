//
//  Ball.swift
//  Ball bounce
//
//  Created by Darvydas on 16/02/16.
//  Copyright © 2016 Darvydas. All rights reserved.
//

import Foundation
import SpriteKit

class Ball: SKSpriteNode {
    
    var world: SKNode!
    var arrow: Arrow!
    
    init(mainScene: SKNode, ballPosition: CGPoint) {
        
        world = mainScene
        
        super.init(texture: SKTexture(imageNamed: "BALL"), color: UIColor.clearColor(), size: CGSizeMake(world.frame.size.width / 16 * kSizeBall, world.frame.size.width / 16 * kSizeBall))
        position = ballPosition
        zPosition = 125
        
        physicsBody = SKPhysicsBody(circleOfRadius: frame.size.width / 2)
        physicsBody?.categoryBitMask = kCategoryBall
        physicsBody?.restitution = 0.3
        physicsBody?.mass = 0.07

        userInteractionEnabled = true
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        print("BALL: Touches began")
        
        physicsBody?.dynamic = false
        physicsBody?.dynamic = true
                
        for touch in touches {
            let location = touch.locationInNode(world)
            let touchedNode = nodeAtPoint(location)
            
            arrow = Arrow(mainScene: world, startingPosition: touchedNode.position)
            world.addChild(arrow)

        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        print("BALL: Touches moved")
        
        world.enumerateChildNodesWithName("arrow", usingBlock: {
            (node: SKNode!, stop: UnsafeMutablePointer <ObjCBool>) -> Void in
            
            node.removeFromParent()
        })
        
        for touch in touches {
            let location = touch.locationInNode(world)
            
            arrow.drawArrow(location)
            
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        print("BALL: Touches ended")
        
        if arrow.angle != nil {
            
            runAction(SKAction.applyImpulse(CGVectorMake(cos(arrow.angle) * arrow.shootPower * world.frame.size.height / 7, sin(arrow.angle) * arrow.shootPower * world.frame.size.width / 7), duration: 0.05))
            
            world.enumerateChildNodesWithName("arrow", usingBlock: {
                (node: SKNode!, stop: UnsafeMutablePointer <ObjCBool>) -> Void in
                
                node.removeFromParent()
            })
        }
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}