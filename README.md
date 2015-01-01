ios-spritekit-snippets
======================

###Description

This repo simply contains sample code for using the SpriteKit framework.

![icon](imgs/spritekit-icon.png)

###Language

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

####Scene Transition

___Swift___

````
	let asteroidScene = AsteroidScene(size: self.frame.size)
	asteroidScene.scaleMode = SKSceneScaleMode.AspectFill
            
	let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 1.0)
	self.view?.presentScene(asteroidScene, transition:transition)
            
````

####Connect
* Twitter: [@clintcabanero](http://twitter.com/clintcabanero)
* GitHub: [ccabanero](http:///github.com/ccabanero)