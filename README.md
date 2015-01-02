ios-spritekit-snippets
======================

##Description

This repo simply contains sample code for using the SpriteKit framework.

![icon](imgs/spritekit-icon.png)

##Languages

Swift and Objective-C

##Snippets

####Adding a sprite primitive to a Scene

___Swift___

````
    let spriteNode = SKSpriteNode(color: SKColor.redColor(), size: CGSize(width: 100, height: 100))
    spriteNode.name = "redSquare"
    spriteNode.position = CGPointMake(CGRectGetMinX(self.frame) + 100, CGRectGetMaxY(self.frame) - 100
    self.addChild(spriteNode)
    
````
___Objective-C___

````
    SKSpriteNode *spriteNode = [[SKSpriteNode alloc] initWithColor:[SKColor redColor] size:CGSizeMake(100, 100)];
    spriteNode.name = @"redSquare";
    spriteNode.position = CGPointMake(CGRectGetMaxX(self.frame) - 100, CGRectGetMinY(self.frame) + 150);
    [self addChild:spriteNode];
    
````

####Adding a sprite with an image/texture to a Scene

___Swift___

````
	let backgroundSpaceNode = SKSpriteNode(imageNamed: "spacebackground")
    backgroundSpaceNode.position = CGPointMake(self.size.width/2, self.size.height/2)
    backgroundSpaceNode.zPosition = -1
    self.addChild(backgroundSpaceNode)
````

___Objective-C___

````
    SKSpriteNode *backgroundSpaceNode = [SKSpriteNode spriteNodeWithImageNamed:@"spacebackground"];
    backgroundSpaceNode.position = CGPointMake(self.size.width/2, self.size.height/2);
    backgroundSpaceNode.zPosition = -1;
    [self addChild:backgroundSpaceNode];
````

####Play a sound file in a Scene

___Swift___

````
	let soundAction = SKAction.playSoundFileNamed("space-ambient.wav", waitForCompletion: true);
    
    //play once
    scene.runAction(soundAction)

    //play and repeat forever
    //self.runAction(SKAction.repeatActionForever(soundAction))
        
````

___Objective-C___

````
	SKAction *soundAction = [SKAction playSoundFileNamed:@"space-ambient.wav" waitForCompletion:YES];
    
    //play once
    [self runAction:soundAction];
    
    //play and repeat forever
    //[self runAction:[SKAction repeatActionForever:soundAction]];
````

####Applying an Action (e.g. Move) to a Sprite Node in a Scene

___Swift___

````
	let moveAction = SKAction.moveByX(100.0, y:0.0, duration: 4.0)
    
    spaceshipNode.runAction(moveAction)
        
````

___Objective-C___

````
	SKAction *moveAction = [SKAction moveByX:100.0 y:0.0 duration:4.0];
	
	[spaceshipNode runAction:moveAction];

````

####Applying a Sequence of Actions to a Sprite Node in a Scene

___Swift___

````
    let hover = SKAction.sequence([SKAction.waitForDuration(0.5),
        SKAction.moveByX(0.0, y:10.0, duration:1.0),
        SKAction.moveByX(0.0, y:5.0, duration:1.0),
        SKAction.waitForDuration(0.5),
        SKAction.moveByX(0.0, y:-10.0, duration:1.0),
        SKAction.moveByX(0.0, y:-5.0, duration:1.0)])
        
    spaceshipNode.runAction(SKAction.repeatActionForever(hover))
        
````

___Objective-C___

````
	SKAction *hover = [SKAction sequence:@[
                                [SKAction waitForDuration:0.5],
                                [SKAction moveByX:0.0 y:10.0 duration:1.0],
                                [SKAction moveByX:0.0 y:5.0 duration:1.0],
                                [SKAction waitForDuration:0.5],
                                [SKAction moveByX:0.0 y:-10 duration:1.0],
                                [SKAction moveByX:0.0 y:-5 duration:1.0]]];
                                
    [spaceshipNode runAction: [SKAction repeatActionForever:hover]];
    
````

####Transitioning Between Scenes

___Swift___

````
	let asteroidScene = AsteroidScene(size: self.frame.size)
	asteroidScene.scaleMode = SKSceneScaleMode.AspectFill
            
	let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 1.0)
	self.view?.presentScene(asteroidScene, transition:transition)
            
````

####Section Name

___Swift___

````
````

___Objective-C___

````
````

##Connect
* Twitter: [@clintcabanero](http://twitter.com/clintcabanero)
* GitHub: [ccabanero](http:///github.com/ccabanero)