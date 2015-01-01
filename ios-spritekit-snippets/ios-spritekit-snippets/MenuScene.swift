//
//  MenuScene.swift
//  ios-spritekit-snippets
//
//  Created by Clint Cabanero on 1/1/15.
//  Copyright (c) 2015 Clint Cabanero. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
   
    override func didMoveToView(view: SKView) {
        
        //scene 1
        let sceneOne = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 100, height: 100))
        sceneOne.name = "Scene1"
        sceneOne.position = CGPointMake(CGRectGetMinX(self.frame) + 100, CGRectGetMaxY(self.frame) - 100)
        self.addChild(sceneOne)
        
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Scene 1"
        myLabel.fontSize = 15
        myLabel.position = CGPointMake(CGRectGetMinX(self.frame) + 100, CGRectGetMaxY(self.frame) - 100)
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        let touch: AnyObject? = touches.anyObject()
        let location = touch?.locationInNode(self)
        let node = self.nodeAtPoint(location!)
        
        if node.name == "Scene1" {
            
            let asteroidScene = AsteroidScene(size: self.frame.size)
            asteroidScene.scaleMode = SKSceneScaleMode.AspectFill
            
            let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 1.0)
            self.view?.presentScene(asteroidScene, transition:transition)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        
    }
    
}
