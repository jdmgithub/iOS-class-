//
//  BBALevelController.m
//  BrickBreaker
//
//  Created by Jisha Obukwelu on 4/17/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "BBALevelController.h"

@interface BBALevelController () <UICollisionBehaviorDelegate>
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
    float points;
    UILabel * pointValue;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.bricks = [@[] mutableCopy];
        self.balls =[@[] mutableCopy];
        
        paddleWidth = 80;
        
        self.view.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
    }
    return self;
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
    [self createBall];
    
    self.collider = [[UICollisionBehavior alloc] initWithItems:[self allItems]];
    self.collider.collisionDelegate = self;
    self.collider.collisionMode = UICollisionBehaviorModeEverything;
    self.collider.translatesReferenceBoundsIntoBoundary = YES; //creates boundary's bounds based oon the reference
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
        UIView * tempBrick;
        
        for (UIView * brick in self.bricks)
        {
            if ([item1 isEqual: brick] || [item2 isEqual:brick])
            {
                if(brick.alpha == 0.5)
                {
                    tempBrick = brick;
                    [brick removeFromSuperview];
                    [self.collider removeItem:brick];
                    
                    pointValue = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
                    pointValue.backgroundColor = [UIColor orangeColor];
                    pointValue.font = [UIFont fontWithName:@"Helvetica" size:5];
                    pointValue.textColor = [UIColor whiteColor];
                    pointValue.text = @"+100";
                    
                    [self.view addSubview:pointValue];
                    
                    points +=100;
                    
                    NSLog(@"Total Points = %f", points);
                    
 //                   [self pointLabelWithBrick:brick];
            }
                brick.alpha = 0.5;
        }
        }
            
    if(tempBrick != nil) [self.bricks removeObjectIdenticalTo:tempBrick]; //finds item in array that is identical to brick hit
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
    for (UIView * item in self.balls) [items addObject:item];
    for (UIView * item in self.bricks) [items addObject:item];
    return items;
}

- (void) createPaddle
{
    self.paddle = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth)/2, SCREEN_HEIGHT -20, paddleWidth, 6)];
    self.paddle.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    self.paddle.layer.cornerRadius = 3;
    [self.view addSubview:self.paddle];
}

- (void) createBrick
{
    int brickCols = 8;
    float brickWidth = (SCREEN_WIDTH - (10 *(brickCols + 1)))/brickCols;
    
    for (int i = 0; i < brickCols; i++)
    {
        float brickX = ((brickWidth + 10) * i) + 10;
        
        UIImageView * brick = [[UIImageView alloc] initWithFrame:CGRectMake(brickX, 10, brickWidth, 30)];
        
        brick.layer.cornerRadius = 6;
        brick.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        
        brick.image = [UIImage imageNamed:@"alien1"];
        
        [self.view addSubview:brick];
        [self.bricks addObject:brick];
    }

}

- (void) createBall
{
    CGRect frame = self.paddle.frame;
    
    UIImageView * ball = [[UIImageView alloc] initWithFrame:CGRectMake(frame.origin.x,frame.origin.y - 50,20, 20)];//make sure it is outside of paddle
    ball.backgroundColor = [UIColor whiteColor];
    ball.layer.cornerRadius = 10;
    ball.image = [UIImage imageNamed:@"ball"];
    [self.view addSubview:ball];
    [self.balls addObject:ball];
    
    self.pusher = [[UIPushBehavior alloc] initWithItems:self.balls mode:UIPushBehaviorModeInstantaneous];
    self.pusher.pushDirection = CGVectorMake(0.1, 0.1);
    self.pusher.active = YES; //Because push is instantaneous, it will only happen once
    [self.animator addBehavior:self.pusher];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
















