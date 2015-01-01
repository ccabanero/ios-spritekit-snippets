//
//  Ship.swift
//  ios-spritekit-snippets
//
//  Created by Clint Cabanero on 1/1/15.
//  Copyright (c) 2015 Clint Cabanero. All rights reserved.
//

import SpriteKit

class Spaceship: NSObject {
   
    func createSpaceshipWithImage(imageName: String) -> SKSpriteNode {
        
        let shipNode = SKSpriteNode(imageNamed: imageName)
        
        shipNode.name = "ship"
        
        shipNode.size = CGSizeMake(300.0, 197.0);
    
        return shipNode
    }
}
