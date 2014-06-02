//
//  SABGameLeftScene.m
//  StuffedAnimalBattale
//
//  Created by Jisha Obukwelu on 5/15/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "SABGameLeftScene.h"
#import "SABGameScene.h"
#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(uint32_t, CollisionType) {
    
    enemyShipCategory        = 0x1 << 0,
    enemyBulletCategory      = 0x1 << 1,
    playerShipCategory       = 0x1 << 2,
    bulletCategory           = 0x1 << 3,
};

@interface SABGameLeftScene () <SKPhysicsContactDelegate>

@end

@implementation SABGameLeftScene
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
    SKSpriteNode * player1A;
    
    SKEmitterNode *fireballR;
    SKEmitterNode *fireballL;
    
    SABGameScene * rightGameScene;
    SABGameLeftScene * leftGameScene;
}

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if(self)
    {
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
        
        timerLabel = [SKLabelNode node];
        timerLabel.position = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT - 30);
        timerLabel.text = @"0.00";
        timerLabel.fontColor = [SKColor greenColor];
        timerLabel.fontSize = 16.0;
        [self addChild:timerLabel];
        
        float barArea = ((SCREEN_WIDTH - 60)/2.0) - 20;
        
        player1HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor lightGrayColor] size:CGSizeMake(barArea, 20)];
        player1HPBar.position = CGPointMake((barArea+ 20)/2.0, SCREEN_HEIGHT - 20.0);
        [self addChild:player1HPBar];
        
        player2HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor lightGrayColor] size:CGSizeMake(barArea, 20)];
        player2HPBar.position = CGPointMake((SCREEN_WIDTH - (barArea+ 20)/2.0), SCREEN_HEIGHT - 20.0);
        [self addChild:player2HPBar];
        
        buttonA = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(40, 40)];
        buttonA.position = CGPointMake(SCREEN_WIDTH - 85, 60);
        [self addChild:buttonA];
        
        buttonB = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(40, 40)];
        buttonB.position = CGPointMake(SCREEN_WIDTH - 40, 60);
        [self addChild:buttonB];
        
        dpadDown = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadDown.position = CGPointMake(90, 50);
        [self addChild:dpadDown];
        
        dpadUp = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadUp.position = CGPointMake(90, 130);
        [self addChild:dpadUp];
        
        dpadLeft = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadLeft.position = CGPointMake(50, 90);
        [self addChild:dpadLeft];
        
        dpadRight = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadRight.position = CGPointMake(130, 90);
        [self addChild:dpadRight];
        
               
        
        player2 = [SKSpriteNode spriteNodeWithImageNamed:@"racoonL" ];
        player2.size = CGSizeMake(100, 100);
        player2.position = CGPointMake(SCREEN_WIDTH * 0.75, 80.0);
        [self addChild:player2];
        
        SKPhysicsBody * playerPhysics = [SKPhysicsBody bodyWithRectangleOfSize:player1A.size];
        player1A.physicsBody = playerPhysics;
        player1A.userData = [@{@"type":@"player1A"} mutableCopy];
        player1A.physicsBody.contactTestBitMask = 1;
        
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
            
            
        }}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    
    CGPoint location = [touch locationInNode:self];
    
    NSLog(@"%f, %f", location.x, location.y);
    NSLog(@"%u", [buttonA containsPoint:location]);
    
    [self testButtonsWithLocationsLeft:location];
}

- (void)testButtonsWithLocationsLeft: (CGPoint)location
{
    NSArray * buttons = @[buttonB, dpadUp, dpadDown, dpadRight, dpadLeft, buttonA, ];
    for (SKNode * button in buttons)
    {
        if([button containsPoint:location])
        {
            switch ([buttons indexOfObject:button])
            {
                case 0://buttonB
                {
                    NSLog(@"Duck");
                }
                    break;
                case 1://up
                {
                    NSLog(@"Jump");
                    [player1A.physicsBody applyImpulse:CGVectorMake(0.0, 200.0)];
                    
                }
                    break;
                case 2://down
                {NSLog(@"Down");
                    //   SKAction * moveDown = [SKAction moveToY:(player1.position.y -5) duration:0.1];
                    // [player1 runAction:moveDown];
                }
                    break;
                    
                case 3://right
                {
                    NSLog(@"Move Right");
                    rightGameScene = [[SABGameScene alloc] initWithSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
                    [self.view addSubview:rightGameScene.view];
                    [leftGameScene removeFromParent];
                }
                    break;
                    
                case 4://left
                {  NSLog(@"Move Left");
                    
                   
                    //[player2.physicsBody applyImpulse:CGVectorMake(- 20.0, 0.0)];
                    
                }
                    break;
                    
                case 5://buttonA
                {
                    NSLog(@"Fire");
                    
                                  }
                    break;
                    break;
            }}}}

@end
