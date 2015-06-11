//
//  GameScene.swift
//  StuffedAnimalMortalKombat
//
//  Created by Kyle Brooks Robinson on 6/9/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import SpriteKit

//protocol GameSceneRef {
//    
//    func playerJoined()
//    func playerLeft()
//
//    
//}

class GameScene: SKScene {
    
    
    let playerCount: CGFloat = 8
    let statsPadding: CGFloat = 20
    var playerStatsWidth: CGFloat!
    
    override func didMoveToView(view: SKView) {
        
 
           playerStatsWidth = (view.bounds.width - (statsPadding * (playerCount + 1))) / playerCount

    }
    
            
        
    
    
    // Player Movement Functions
    
    // Player Attack Functions
    
    
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
//        
//        for touch in (touches as! Set<UITouch>) {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
    }
   
    var sunRotation: Double = 0
    
    override func update(currentTime: CFTimeInterval) {

        if let sun = childNodeWithName("Sun") {
            
            let radius = DistanceBetweenPoint1(sun.position, andPoint2: position)
            
            sunRotation = sunRotation < 360 ? sunRotation + 1.5 : 0
            
            let angle = CGFloat(DegreesToRadians(sunRotation))
          
            sun.position.x = position.x + radius * cos(angle) + view!.center.x
            sun.position.y = position.y + radius * sin(angle) + view!.center.y

            
        }
    
    }
    
}









