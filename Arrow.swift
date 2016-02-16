//
//  Arrow.swift
//  Ball bounce
//
//  Created by Darvydas on 16/02/16.
//  Copyright © 2016 Darvydas. All rights reserved.
//

import Foundation
import SpriteKit

class Arrow: SKSpriteNode {
    
    var world: SKNode!
    
    var startPosition: CGPoint!
    var shootPower: CGFloat!
    var angle: CGFloat!
    
    init(mainScene: SKNode, startingPosition: CGPoint) {
        
        world = mainScene
        
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(1, 1))
        zPosition = 150
        name = "arrow"
        
        startPosition = startingPosition
    }
    
    func drawArrow(endingPoint: CGPoint) {
        
        let pathToDraw:CGMutablePathRef = CGPathCreateMutable()
        let myLine:SKShapeNode = SKShapeNode(path:pathToDraw)
        myLine.name = "arrow"
        
        let xDistance = endingPoint.x - startPosition.x
        let yDistance = endingPoint.y - startPosition.y
        let distance = sqrt(xDistance * xDistance + yDistance * yDistance)
        angle = atan2(yDistance, xDistance)
        
        if distance > world.frame.size.width / 5 {
            
            shootPower = 1.0
            
            CGPathMoveToPoint(pathToDraw, nil, cos(angle) * world.frame.size.width / 5 + startPosition.x, sin(angle) * world.frame.size.width / 5 + startPosition.y)
            CGPathAddLineToPoint(pathToDraw, nil, startPosition.x, startPosition.y)
            
        } else {
            
            shootPower = distance / (world.frame.size.width / 5)
            
            CGPathMoveToPoint(pathToDraw, nil, endingPoint.x, endingPoint.y)
            CGPathAddLineToPoint(pathToDraw, nil, startPosition.x, startPosition.y)
        }
        
        print(shootPower)
        
        myLine.path = pathToDraw
        myLine.strokeColor = SKColor.redColor()
        
        world.addChild(myLine)
        
    }
    
//    func createArrowTip(tipPosition: CGPoint) {
//        
//        let trianglePath = CGPathCreateMutable()
//        
//        let triangle:SKShapeNode = SKShapeNode(path:trianglePath)
//        
//        CGPathMoveToPoint(trianglePath, nil, tipPosition.x, tipPosition.y)
//        CGPathAddLineToPoint(trianglePath, nil, world.frame.size.width/2, -world.frame.size.height/2)
//        CGPathAddLineToPoint(trianglePath, nil, 0, world.frame.size.height/2)
//        CGPathAddLineToPoint(trianglePath, nil, -world.frame.size.width/2, -world.frame.size.height/2)
//        
//        addChild(trianglePath)
//    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
