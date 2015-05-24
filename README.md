ios-spritekit-snippets
======================

##Description

This repo simply contains sample code for using the SpriteKit framework.

![icon](imgs/spritekit-icon.png)

##Languages

Swift and Objective-C

##Code Snippets

At the time of this writing, a majority of the SpriteKit framework documentation was written with code samples in __Objective-C__.  The snippets below translate various SpriteKit patterns using __Swift__.

####Jump to a Topic

[Adding a Sprite Primitive to a Scene](https://github.com/ccabanero/ios-spritekit-snippets#adding-a-sprite-primitive-to-a-scene)

[Adding a Sprite with an Image/Texture to a Scene](https://github.com/ccabanero/ios-spritekit-snippets#adding-a-sprite-with-an-imagetexture-to-a-scene)

[Playing a Sound file in a Scene](https://github.com/ccabanero/ios-spritekit-snippets#playing-a-sound-file-in-a-scene)

[Applying an Action (e.g. Move) to a Sprite Node in a Scene](https://github.com/ccabanero/ios-spritekit-snippets#applying-an-action-eg-move-to-a-sprite-node-in-a-scene)

[Applying a Sequence of Actions to a Sprite Node in a Scene](https://github.com/ccabanero/ios-spritekit-snippets#applying-a-sequence-of-actions-to-a-sprite-node-in-a-scene)

[Executing a Callback after Running an Action on a Sprite Node](https://github.com/ccabanero/ios-spritekit-snippets#executing-a-callback-after-running-an-action-on-a-sprite-node)

[Executing a Custom Action](https://github.com/ccabanero/ios-spritekit-snippets#executing-a-custom-action)

[Animating Textures and Executing Multiple Actions in Parallel](https://github.com/ccabanero/ios-spritekit-snippets#animating-textures-and-executing-multiple-actions-in-parallel)

[Handling a User's Touch Gestures on a Scene](https://github.com/ccabanero/ios-spritekit-snippets#handling-a-users-touch-gestures-on-a-scene)

[Configuring the Physics Body property of a Sprite Node](https://github.com/ccabanero/ios-spritekit-snippets#configuring-the-physics-body-property-of-a-sprite-node)

[Detecting Collision Between Sprite Node Physics Bodies](https://github.com/ccabanero/ios-spritekit-snippets#detecting-collision-between-sprite-node-physics-bodies)

[Creating an SKEmitter Node (e.g. Particles/Explosion)](https://github.com/ccabanero/ios-spritekit-snippets#creating-an-skemitter-node-eg-particlesexplosion)

[Adding a SpriteKit Particle File to your Scene](https://github.com/ccabanero/ios-spritekit-snippets#adding-a-spritekit-particle-file-to-your-scene)

[Transitioning Between Scenes](https://github.com/ccabanero/ios-spritekit-snippets#transitioning-between-scenes)


####Adding a Sprite Primitive to a Scene

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

####Adding a Sprite with an Image/Texture to a Scene

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

####Playing a Sound file in a Scene

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

####Executing a Callback after Running an Action on a Sprite Node

___Swift___

````
	//laser action
	let laserAction = SKAction.moveToX(1600, duration: 0.5)

	//run action, then do something afterwards
    laser.runAction(laserAction, completion:{
            
        laser.hidden = true
        laser.physicsBody?.dynamic = false
    })
        
````

####Executing a Custom Action

___Swift___

````
	let customAction = SKAction.customActionWithDuration(0.0, actionBlock: { (node:SKNode!, elapsed: CGFloat) -> Void in
            self.addAsteroidToScene()
        })
        
    scene.runAction(customAction)
````

___Objective-C___

````
	SKAction *makeAsteroids = [SKAction sequence:@[
                                                   [SKAction performSelector:@selector(generateAsteroid) onTarget:self],
                                                   [SKAction waitForDuration:3.0 withRange:0.2]
                                                   ]];
    
    [scene runAction: [SKAction repeatActionForever:makeAsteroids]];
````

####Animating Textures and Executing Multiple Actions in Parallel

___Swift___

````
	//textures for walk animation
    let walkTexture1 = SKTexture(imageNamed: "walk1")
    let walkTexture2 = SKTexture(imageNamed: "walk2")

    //simulate walking by animating textures
    let walkAction = SKAction.animateWithTextures([walkTexture1, walkTexture2], timePerFrame: 0.2)
    let repeatedWalkAction = SKAction.repeatActionForever(walkAction)
        
    //action for moving
    let moveAction = SKAction.moveByX(100, y: 0, duration: 2.0)
    let repeatedMoveAction = SKAction.repeatActionForever(moveAction)
        
    //execute multiple actions in parallel (walk animatoin + moving)
    let walkAnimation = SKAction.group([repeatedWalkAction, repeatedMoveAction])
        
    scene.runAction(walkAnimation)
````

####Handling a User's Touch Gestures on a Scene

___Swift___

````
override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
	//get touch gesture
    let touch: AnyObject? = touches.anyObject()
        
    //get location of touch 
    let location = touch?.locationInNode(self)
        
    //get the node that was touched
    let node = self.nodeAtPoint(location!)
        
    //query for node of interest
    if(node.name == "fireButtonNode") {
            
        //do stuff
        //println("fire")
    }
}
    
override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
	//iterate pan gesture
    for touch: AnyObject in touches {
            
        //get location of touch
        let location = touch.locationInNode(self)
            
        //query for node of interest
        let node = self.nodeAtPoint(location)
            
        if(node.name == "fireButtonNode") {
                
            continue
        }
            
        //move spaceship to finger touch location
        let newPosition: CGPoint = CGPointMake(location.x + 150.0, location.y)
        let moveAction: SKAction = SKAction.moveTo(newPosition, duration: 0.8)
        spaceshipNode.runAction(moveAction)
    }
}
````

___Objective-C___

````
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //get the touch gesture
    UITouch *touch = [touches anyObject];
    
    //get location of touch
    CGPoint location = [touch locationInNode:self];
    
    //get node that was touched
    SKNode *node = [self nodeAtPoint:location];
    
    //query for node of interest
    if([node.name isEqualToString:@"fireButtonNode"]) {
        
        //do stuff...
        //NSLog(@"%@", @"fire!");
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //iterate pan gesture
    for (UITouch *touch in touches) {
        
        //get location of touch
        CGPoint location = [touch locationInNode:self];
        
        //query for node of interest
        SKNode *node = [self nodeAtPoint:location];
        
        if([node.name isEqualToString:@"fireButtonNode"]) {
            
            continue;
        }
        
        //move spaceship to finger touch location
        CGPoint newPosition = CGPointMake(location.x + 150.0f, location.y);
        SKAction *moveAction = [SKAction moveTo:newPosition duration:0.8];
        [spaceshipNode runAction:moveAction];
    }
}
````

####Configuring the Physics Body property of a Sprite Node

___Swift___

````
	spaceshipNode.physicsBody = SKPhysicsBody(circleOfRadius: 75)
    spaceshipNode.physicsBody?.affectedByGravity = false
    spaceshipNode.physicsBody?.mass = 0.02
    
````

___Objective-C___

````
	...
	spaceshipNode.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:75];
    spaceshipNode.falconNode.physicsBody.affectedByGravity = NO;
    spaceshipNode.falconNode.physicsBody.mass = 0.02;
    
````

####Detecting Collision Between Sprite Node Physics Bodies

___Swift___

````
	for asteroid in self.asteroid.collection {
                    
		if asteroid.hidden {
                        
			continue
		}
                    
		if asteroid.intersectsNode(laser) {
                        
			asteroid.blowUp()
                        
			continue
		}
	}

````

___Objective-C___

````
	for(SKSpriteNode *asteroid in self.asteroids) {
            
		if(asteroid.hidden) {
		
			continue;
		}
            
		if([asteroid intersectsNode:laser]) {
                
			[self blowUpAsteroid:asteroid withLaser:laser];
                
			continue;
		}
	}
````

####Creating an SKEmitter Node (e.g. Particles/Explosion)

___Swift___

````
    private func newExplosion() -> SKEmitterNode {
        
        let explosion = SKEmitterNode()
        
        let image = UIImage(named:"spark.png")!
        explosion.particleTexture = SKTexture(image: image)
        explosion.particleColor = UIColor.brownColor()
        explosion.numParticlesToEmit = 100
        explosion.particleBirthRate = 450
        explosion.particleLifetime = 2
        explosion.emissionAngleRange = 360
        explosion.particleSpeed = 100
        explosion.particleSpeedRange = 50
        explosion.xAcceleration = 0
        explosion.yAcceleration = 0
        explosion.particleAlpha = 0.8
        explosion.particleAlphaRange = 0.2
        explosion.particleAlphaSpeed = -0.5
        explosion.particleScale = 0.75
        explosion.particleScaleRange = 0.4
        explosion.particleScaleSpeed = -0.5
        explosion.particleRotation = 0
        explosion.particleRotationRange = 0
        explosion.particleRotationSpeed = 0
        explosion.particleColorBlendFactor = 1
        explosion.particleColorBlendFactorRange = 0
        explosion.particleColorBlendFactorSpeed = 0
        explosion.particleBlendMode = SKBlendMode.Add
        
        return explosion
    }
    
````

___Objective-C___

````

- (SKEmitterNode *)newExplosion {
    
    //instantiate explosion emitter
    SKEmitterNode *explosion = [[SKEmitterNode alloc] init];
    
    //[explosion setParticleTexture:[SKTexturetext:@"asteroid1"]];
    UIImage *image = [UIImage imageNamed:@"spark.png"];
    [explosion setParticleTexture:[SKTexture textureWithImage:image]];
    [explosion setParticleColor:[UIColor brownColor]];
    [explosion setNumParticlesToEmit:100];
    [explosion setParticleBirthRate:450];
    [explosion setParticleLifetime:2];
    [explosion setEmissionAngleRange:360];
    [explosion setParticleSpeed:100];
    [explosion setParticleSpeedRange:50];
    [explosion setXAcceleration:0];
    [explosion setYAcceleration:0];
    [explosion setParticleAlpha:0.8];
    [explosion setParticleAlphaRange:0.2];
    [explosion setParticleAlphaSpeed:-0.5];
    [explosion setParticleScale:0.75];
    [explosion setParticleScaleRange:0.4];
    [explosion setParticleScaleSpeed:-0.5];
    [explosion setParticleRotation:0];
    [explosion setParticleRotationRange:0];
    [explosion setParticleRotationSpeed:0];
    
    [explosion setParticleColorBlendFactor:1];
    [explosion setParticleColorBlendFactorRange:0];
    [explosion setParticleColorBlendFactorSpeed:0];
    [explosion setParticleBlendMode:SKBlendModeAdd];
    
    return explosion;
}
````

####Adding a SpriteKit Particle File to your Scene

___Swift___

````

	//create file via Xcode - File - SpriteKit Particle File - template ...
	
	 let fireEmitter = SKEmitterNode(fileNamed: "smallFire.sks")
     fireEmitter.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 200)
     fireEmitter.name = "smallFire"
     fireEmitter.zPosition = 1
     fireEmitter.targetNode = self
     fireEmitter.particleLifetime = 1
        
     self.addChild(fireEmitter)
````

####Transitioning Between Scenes

___Swift___

````
	let asteroidScene = AsteroidScene(size: self.frame.size)
	asteroidScene.scaleMode = SKSceneScaleMode.AspectFill
            
	let transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 1.0)
	self.view?.presentScene(asteroidScene, transition:transition)
            
````

##Connect
* Twitter: [@clintcabanero](http://twitter.com/clintcabanero)
* GitHub: [ccabanero](http:///github.com/ccabanero)