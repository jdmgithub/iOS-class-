//
//  BBALevelController.m
//  BrickBreaker
//
//  Created by Jisha Obukwelu on 4/17/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "BBALevelController.h"
#import "MOVE.h"

#import <AVFoundation/AVFoundation.h>

@interface BBALevelController () <UICollisionBehaviorDelegate>

@property(nonatomic) AVAudioPlayer * player;
//All PRIVATE PROPERTIES
@property (nonatomic) UIView * paddle;
@property (nonatomic) NSMutableArray * balls;
@property (nonatomic) NSMutableArray *bricks;

//dynamics animator
@property (nonatomic) UIDynamicAnimator * animator;

//pushes the ball
@property (nonatomic) UIPushBehavior * pusher;

//handles the collisions
@property (nonatomic) UICollisionBehavior * collider;

//item behavior properties
@property (nonatomic) UIDynamicItemBehavior * paddleDynamicsProperties;
@property (nonatomic) UIDynamicItemBehavior * ballsDynamicsProperties;
@property (nonatomic) UIDynamicItemBehavior * bricksDynamicsProperties;

//item attachement
@property (nonatomic) UIAttachmentBehavior * attacher;

@end

@implementation BBALevelController
{
    float paddleWidth;
    int points;
    int lives;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.bricks = [@[] mutableCopy];
        self.balls =[@[] mutableCopy];
        
        paddleWidth = 80;
        points = 0;
        lives = 3;
//        gamePoint = 0;
//        levelPoints = 0;
//        bricksBroken = 0;
//        livesLost = 0;
//        paddleHits = 0;
//        ceilingHits = 0;
//        leftWallHits = 0;
//        rightWallHits = 0;
        
        self.view.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapScreen:)];
        [self.view addGestureRecognizer:tap];
    }
    return self;
}

- (void)playSoundWithName:(NSString *)soundName
{
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    NSURL * url = [[NSURL alloc] initFileURLWithPath:file];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [self.player play];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)resetLevel
{
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    [self createPaddle];
    [self createBrick];
    
    self.collider = [[UICollisionBehavior alloc] initWithItems:[self allItems]];
    self.collider.collisionDelegate = self;
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
//    self.collider.translatesReferenceBoundsIntoBoundary = YES; //creates boundary's bounds based on the reference
    
    //create balls after collider so balls can take collider properties
    [self createBall];
    
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;
    
    [self.collider addBoundaryWithIdentifier:@"ceiling" fromPoint:CGPointMake(0,0) toPoint:CGPointMake(w, 0)];
    [self.collider addBoundaryWithIdentifier:@"leftWall" fromPoint:CGPointMake(0,0) toPoint:CGPointMake(0, h)];
    [self.collider addBoundaryWithIdentifier:@"rightWall" fromPoint:CGPointMake(w,0) toPoint:CGPointMake(w, h)];
    [self.collider addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0,h+10) toPoint:CGPointMake(w, h + 10)];
    
    [self.animator addBehavior:self.collider];

    
    self.ballsDynamicsProperties = [self createPropertiesForItems:self.balls];
    self.bricksDynamicsProperties = [self createPropertiesForItems:self.bricks];
    self.paddleDynamicsProperties = [self createPropertiesForItems:@[self.paddle]];
    
    self.paddleDynamicsProperties.density = 200000;
    self.bricksDynamicsProperties.density = 200000;
    
    
    //Step 4: Better collision, no friction
    self.ballsDynamicsProperties.elasticity = 1.0;
    self.ballsDynamicsProperties.resistance = 0.0;
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
    
    if ([item1 isEqual:self.paddle] || [item2 isEqual:self.paddle])
    {
        [self playSoundWithName:@"retro_click"];
//        paddleHits++;
//        levelInfo[@"paddle_hits"] = @(paddleHits);
    }
    UIView * tempBrick;
    
    for (UIView * brick in self.bricks)
    {
        if ([item1 isEqual: brick] || [item2 isEqual:brick])
        {
            if(brick.alpha == 0.5 )
            {
                tempBrick = brick;
                [brick removeFromSuperview];
                [self.collider removeItem:brick];
                
                points +=brick.tag;
                
                [self pointLabelWithBrick:brick];
                
                [self.delegate addPoints:(int)points];
                
/*
                [UIView animateWithDuration:0.4 animations:^{
                    label.alpha = 0.0;
                } completion:^(BOOL finished){
                    [label removeFromSuperview];
                }]
 */
            }
            brick.alpha = 0.5;
        }
    }
    
    if(tempBrick != nil)
    {
        [self playSoundWithName:@"electric_alert"];
        [self.bricks removeObjectIdenticalTo:tempBrick]; //finds item in array that is identical to brick hit
    }
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    if([(NSString *)identifier isEqualToString:@"floor"])
    {
        UIView * ball = (UIView *)item;
        NSLog(@"START OVER");
        [ball removeFromSuperview];
        [self.collider removeItem:ball];
        
        //associates lives with ball going through floor
        lives--;
        
        if(lives > 0) [self createBall];
        
        [self.delegate reduceLives:lives];
        
        //lives must equal 0 before game restarts
       if([self.delegate respondsToSelector:@selector(gameDone)] && lives == 0)
            [self.delegate gameDone];
    }
}

- (void)pointLabelWithBrick:(UIView *)brick
{
    UILabel * pointValue = [[UILabel alloc] initWithFrame:brick.frame];
    pointValue.backgroundColor = [UIColor clearColor];
    pointValue.font = [UIFont fontWithName:@"Helvetica" size:12];
    pointValue.textColor = [UIColor whiteColor];
    pointValue.text = [NSString stringWithFormat:@"+%d",(int)brick.tag];
    pointValue.textAlignment = NSTextAlignmentCenter;

    [self.view addSubview:pointValue];
    
    [MOVE animateView:pointValue properties:@{@"alpha":@0, @"duration":@1, @"delay":@0.0, @"remove":@YES}];
}


- (UIDynamicItemBehavior*)createPropertiesForItems:(NSArray *)items
{
    UIDynamicItemBehavior * properties = [[UIDynamicItemBehavior alloc] initWithItems:items];
    properties.allowsRotation = NO;
    properties.friction = 0.0;
    [self.animator addBehavior:properties];
    return properties;//must return something
}

- (NSArray *)allItems
{
    NSMutableArray * items = [@[self.paddle]mutableCopy];
//    for (UIView * item in self.balls) [items addObject:item];
    for (UIView * item in self.bricks) [items addObject:item];
    return items;
}

- (void)createPaddle
{
    self.paddle = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth)/2, SCREEN_HEIGHT -60, paddleWidth, 6)];
    self.paddle.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    self.paddle.layer.cornerRadius = 3;
    [self.view addSubview:self.paddle];
    
    self.attacher  = [[UIAttachmentBehavior alloc] initWithItem:self.paddle attachedToAnchor:CGPointMake(CGRectGetMidX(self.paddle.frame),CGRectGetMidY(self.paddle.frame))];
    [self.animator addBehavior:self.attacher];
}

- (void) createBrick
{
    int brickRows =6;
    int brickCols = 8;
    
    float brickWidth = (SCREEN_WIDTH - (10 *(brickCols + 1)))/brickCols;
    float brickHeight = 20;
    
    for (int row = 0; row < brickRows; row++)
    {
        for (int col = 0; col < brickCols; col++)
        {
            float brickX = ((brickWidth + 10) * col) + 10;
            float brickY = ((brickHeight + 10) * row) + 10;
            
            UIImageView * brick = [[UIImageView alloc] initWithFrame:CGRectMake(brickX, brickY, brickWidth, brickHeight)];
            
            brick.layer.cornerRadius = 6;
            brick.backgroundColor = [UIColor clearColor];//colorWithWhite:0.7 alpha:1.0];
            
            brick.image = [UIImage imageNamed:@"alien1"];
            
            int random = arc4random_uniform(5) * 50;
            brick.tag = random;
            
            [self.view addSubview:brick];
            [self.bricks addObject:brick];
        }
    }
}

- (void)createBall
{
    CGRect frame = self.paddle.frame;
    
    UIImageView * ball = [[UIImageView alloc] initWithFrame:CGRectMake(frame.origin.x,frame.origin.y - 90,20, 20)];//make sure it is outside of paddle
    ball.backgroundColor = [UIColor whiteColor];
    ball.layer.cornerRadius = 10;
    ball.image = [UIImage imageNamed:@"ball"];
    [self.view addSubview:ball];
    [self.balls addObject:ball];
    
    //adding ball with dynamic property
    [self.collider addItem:ball];
    [self.ballsDynamicsProperties addItem:ball];
    
    self.pusher = [[UIPushBehavior alloc] initWithItems:self.balls mode:UIPushBehaviorModeInstantaneous];
    self.pusher.pushDirection = CGVectorMake(0.08, 0.08);
    self.pusher.active = YES; //Because push is instantaneous, it will only happen once
    [self.animator addBehavior:self.pusher];

}

- (void)tapScreen:(UITapGestureRecognizer *)gr
{
    CGPoint location = [gr locationInView:self.view];
    self.attacher.anchorPoint = CGPointMake(location.x, self.attacher.anchorPoint.y);
    
    //    CGPoint origin = self.paddlePosition.frame.origin;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
















