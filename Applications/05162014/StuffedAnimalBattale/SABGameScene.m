//
//  SABGameScene.m
//  StuffedAnimalBattale
//
//  Created by Jisha Obukwelu on 5/15/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "SABGameScene.h"
#import "SABViewController.h"


typedef NS_ENUM(uint32_t, CollisionType)
{
    enemyShipCategory        = 0x1 << 0,
    enemyBulletCategory      = 0x1 << 1,
    playerShipCategory       = 0x1 << 2,
    bulletCategory           = 0x1 << 3,
};

@interface SABGameScene () <SKPhysicsContactDelegate>
@property (nonatomic) int textureWidth;

@end

@implementation SABGameScene
{
    SKLabelNode * timerLabel;
    SKSpriteNode * player1HPBar;
    SKSpriteNode * player2HPBar;
    
    SKSpriteNode * buttonA;
    SKSpriteNode * buttonB;
    
    SKSpriteNode * dpadUp;
    SKSpriteNode * dpadDown;
    SKSpriteNode * dpadLeft;
    SKSpriteNode * dpadRight;
    
    SKSpriteNode * player1;
    SKSpriteNode * player2;
    
    SKTextureAtlas * charAtlas;
    SKTextureAtlas * danceAtlas;
    
    SABViewController * SABVC;
}

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if(self)
    {
        self.textureWidth = 0.1;
        
        self.backgroundColor = [UIColor cyanColor];
        
        charAtlas = [SKTextureAtlas atlasNamed:@"char"];
        danceAtlas = [SKTextureAtlas atlasNamed:@"dance"];
        
        SKPhysicsBody * scenePhysics = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(0, 0, size.width, size.height)];
        self.physicsBody = scenePhysics;
        self.physicsBody.contactTestBitMask = 0.0;
        self.physicsWorld.contactDelegate = self;
        
        SKSpriteNode * floor = [SKSpriteNode spriteNodeWithColor:[SKColor yellowColor] size:CGSizeMake(SCREEN_WIDTH, 30)];
        floor.position = CGPointMake(SCREEN_WIDTH/2.0, 15);
        [self addChild:floor];
        
        SKPhysicsBody * floorPhysics = [SKPhysicsBody bodyWithRectangleOfSize:floor.size];
        floorPhysics.affectedByGravity = NO;
        floorPhysics.dynamic = NO;
        
        floor.physicsBody = floorPhysics;

        player1 = [SKSpriteNode spriteNodeWithImageNamed:@"charframe1"];
        player1.size = CGSizeMake(100, 100);
        player1.position = CGPointMake(SCREEN_WIDTH/3.0, 80.0);
        [self addChild:player1];
        
        NSMutableArray * textures = [@[] mutableCopy];
        
        for(int i = 1; i<danceAtlas.textureNames.count; i++)
        {
            [textures addObject:[danceAtlas textureNamed:[NSString stringWithFormat:@"dance%d", i]]];
        }
        
        SKAction * dance = [SKAction animateWithTextures:textures timePerFrame:0.2];
        SKAction * danceAllNight = [SKAction repeatActionForever:dance];
        
        [player1 runAction:dance];
        [player1 runAction:danceAllNight];
        
        player2 = [SKSpriteNode spriteNodeWithImageNamed:@"charframe1"];
        player2.size = CGSizeMake(100, 100);
        player2.position = CGPointMake(SCREEN_WIDTH * 0.75, 80.0);
        [self addChild:player2];
        
        [player2 runAction:dance];
        [player2 runAction:danceAllNight];
        
        
        SKPhysicsBody * playerPhysics = [SKPhysicsBody bodyWithRectangleOfSize:player1.size];
        player1.physicsBody = playerPhysics;
        player1.userData = [@{@"type":@"player1"} mutableCopy];
        player1.physicsBody.contactTestBitMask = 1;
        
        SKPhysicsBody * player2Physics = [SKPhysicsBody bodyWithRectangleOfSize:player2.size];
        player2.physicsBody = player2Physics;
        player2.userData = [@{@"type":@"player2"} mutableCopy];
        player2.physicsBody.categoryBitMask = 1;
    }
    return self;
}

- (void)didBeginContact:(SKPhysicsContact *)contact
{
    NSMutableArray * nodes = [@[]mutableCopy];
    
    if(contact.bodyA.node !=nil) [nodes addObject:contact.bodyA.node];
    if(contact.bodyB.node !=nil) [nodes addObject:contact.bodyB.node];
    
    for(SKNode * node in nodes)
    {
        if ([node.userData[@"type"] isEqualToString:@"fireball"])
        {
            [node removeFromParent];
            
            NSString *myParticlePath = [[NSBundle mainBundle]pathForResource:@"Explosion" ofType:@"sks"];
            SKEmitterNode *explosion = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
            
            explosion.position = contact.contactPoint;
            
            explosion.numParticlesToEmit = 200;
            
            [self addChild:explosion];
            
            [SABVC decreaseHealthBar];
        }}
}

- (void)buttonClick: (UIButton * )sender
{
    NSString *myParticlePath = [[NSBundle mainBundle]pathForResource:@"Fireball" ofType:@"sks"];
    SKEmitterNode *fireball = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
    
    fireball.position = CGPointMake(player1.position.x + 57.0, player1.position.y) ;
    
    SKPhysicsBody * fireballRPhysics = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10, 10)];
    
    fireballRPhysics.affectedByGravity = NO;
    
    fireball.physicsBody = fireballRPhysics;
    
    fireball.physicsBody.contactTestBitMask = 1;
    
    fireball.userData = [@{@"type":@"fireball"}mutableCopy];
    
    [self addChild:fireball];
    
    [fireballRPhysics applyImpulse:CGVectorMake(10.0, 1.0)];
}

- (void)buttonClick2: (UIButton * )sender
{
    NSString *myParticlePath = [[NSBundle mainBundle]pathForResource:@"Fireball" ofType:@"sks"];
    SKEmitterNode *fireball = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
    
    fireball.position = CGPointMake(player2.position.x - 57.0, player1.position.y) ;
    
    SKPhysicsBody * fireballRPhysics = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10, 10)];
    
    fireballRPhysics.affectedByGravity = NO;
    
    fireball.physicsBody = fireballRPhysics;
    
    fireball.physicsBody.contactTestBitMask = 1;
    
    fireball.userData = [@{@"type":@"fireball"}mutableCopy];
    
    [self addChild:fireball];
    
    [fireballRPhysics applyImpulse:CGVectorMake(-10.0, 1.0)];
}

- (void)dpadUp: (UIButton *)sender
{
    NSMutableArray * textures = [@[] mutableCopy];
    
    for(int i = 1; i < charAtlas.textureNames.count + 1; i++)
    {
        NSLog(@"charframe%d", i);
        [textures addObject:[charAtlas textureNamed:[NSString stringWithFormat:@"charframe%d", i]]];
    }
    SKAction * setFrame2 = [SKAction animateWithTextures:textures timePerFrame:0.2];
    
    [player1 runAction:setFrame2];
    
    [player1.physicsBody applyImpulse:CGVectorMake(0.0, 300.0)];
    
    [player2 runAction:setFrame2];
    
    [player2.physicsBody applyImpulse:CGVectorMake(0.0, 300.0)];
}

- (void)dpadDown: (UIButton *)sender
{
    SKAction * moveDown = [SKAction moveToY:(player1.position.y -5) duration:0.1];
    [player1 runAction:moveDown];
    
    SKAction * moveDown2 = [SKAction moveToY:(player2.position.y -5) duration:0.1];
    [player2 runAction:moveDown2];
}

- (void)dpadLeft: (UIButton *)sender
{
    [player1.physicsBody applyImpulse:CGVectorMake(40.0, 5.0)];
    [player2.physicsBody applyImpulse:CGVectorMake(-40.0, 5.0)];
}

- (void)dpadRight: (UIButton *)sender
{
    [player1.physicsBody applyImpulse:CGVectorMake(- 40.0, 5.0)];
    [player2.physicsBody applyImpulse:CGVectorMake( 40.0, 5.0)];
}



@end
