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
    
        self.createBackgroundNode()
        
    }
    
    func createBackgroundNode() {
        
        let backgroundSpaceNode = SKSpriteNode(imageNamed: "spacebackground")
        backgroundSpaceNode.position = CGPointMake(self.size.width/2, self.size.height/2)
        backgroundSpaceNode.zPosition = -1
        self.addChild(backgroundSpaceNode)
    }
}
