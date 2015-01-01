//
//  AsteroidScene.swift
//  ios-spritekit-snippets
//
//  Created by Clint Cabanero on 1/1/15.
//  Copyright (c) 2015 Clint Cabanero. All rights reserved.
//

import SpriteKit

class AsteroidScene: SKScene {
    
    override func didMoveToView(view: SKView) {
    
        self.addBackgroundNode()
        
        self.addSpaceship()
    }
    
    func addBackgroundNode() {
        
        let backgroundSpaceNode = SKSpriteNode(imageNamed: "spacebackground")
        backgroundSpaceNode.position = CGPointMake(self.size.width/2, self.size.height/2)
        backgroundSpaceNode.zPosition = -1
        
        self.addChild(backgroundSpaceNode)
    }
    
    func addSpaceship() {
        
        let spaceship: Spaceship = Spaceship()

        let millenniumFalcon = spaceship.createSpaceshipWithImage("falcon_oblique")
        millenniumFalcon.position = CGPointMake(CGRectGetMidX(self.frame) - 300, CGRectGetMidY(self.frame))
        millenniumFalcon.zPosition = 1;
        
        self.addChild(millenniumFalcon)
    }
}
