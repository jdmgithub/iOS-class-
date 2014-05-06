//
//  PNAPixelWorldController.m
//  PixelNoise
//
//  Created by Jisha Obukwelu on 5/5/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//


#import "PNAPixelWorldController.h"
#import "PNAPixelSounds.h"

@interface PNAPixelWorldController () <UICollisionBehaviorDelegate>

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic) UIGravityBehavior * gravityBehavior;
@property (nonatomic) UICollisionBehavior * collisionBehavior;
@property (nonatomic) UIView * square;
@property (nonatomic) UIAttachmentBehavior * attacher;
@property (nonatomic) NSArray * squares;
@property (nonatomic) UIDynamicItemBehavior * squareDynamicsProperties;
@property (nonatomic) UIPushBehavior * pusherBehavior;

@end

@implementation PNAPixelWorldController
{
    PNAPixelSounds * sounds;
    CGPoint point;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.view.backgroundColor = [UIColor yellowColor];
        sounds = [[PNAPixelSounds alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)createSquares
{
    self.square = [[UIView alloc] initWithFrame:CGRectMake(point.x,point.y,10,10)];
    self.square.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.square];
    
    
//    [self.squares a:self.square];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.square]];
    [self.animator addBehavior:self.gravityBehavior];
    
    self.collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.square]];
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    self.collisionBehavior.collisionDelegate = self;
    
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;
    
    
    [self.collisionBehavior addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0,h+10)
                                              toPoint:CGPointMake(w, h+10)];
    
    [self.animator addBehavior:self.collisionBehavior];
    
    self.squareDynamicsProperties = [self createPropertiesForItems:@[self.square]];
    self.squareDynamicsProperties.density = 5;
    self.squareDynamicsProperties.elasticity = 0.2;
    self.squareDynamicsProperties.resistance = 0.0;
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[[event allTouches]anyObject];
    point = [touch locationInView:self.view];
    [sounds playSoundWithName:@"click_alert"];
    [self createSquares];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[[event allTouches]anyObject];
    point = [touch locationInView:self.view];
    [sounds playSoundWithName:@"click_alert"];
    [self createSquares];
}

- (UIDynamicItemBehavior*)createPropertiesForItems:(NSArray *)square
{
    UIDynamicItemBehavior * properties = [[UIDynamicItemBehavior alloc] initWithItems:square];
    properties.allowsRotation = NO;
    properties.friction = 0.0;
    properties.elasticity = 1.0;
    properties.density = 1;
    [self.animator addBehavior:properties];
    return properties;//must return something
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
//    if ([self.square isEqual:@"floor"])
//    {
        int createSquares = 6;
       for(int i = 0; i<createSquares; i++)
       {
           UIView * square1 = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, 10, 10)];
           square1.backgroundColor = [UIColor greenColor];
           [self.view addSubview:square1];
           
           self.pusherBehavior = [[UIPushBehavior alloc] initWithItems:@[square1] mode:UIPushBehaviorModeInstantaneous];
           self.pusherBehavior.pushDirection = CGVectorMake(-0.02, 0.02);
           self.pusherBehavior.active = YES; //Because push is instantaneous, it will only happen once
           [self.animator addBehavior:self.pusherBehavior];

    
            [sounds playSoundWithName:@"electric_alert"];
            [self.collisionBehavior removeItem:self.square];
         }
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier
{
//    int createSquares = 6;
//    for(int i = 0; i<createSquares; i++)
//    {
//        UIView * square1 = [[UIView alloc] initWithFrame:CGRectMake(point.x, point.y, 10, 10)];
//        square1.backgroundColor = [UIColor greenColor];
//        [self.view addSubview:square1];
    
        [sounds playSoundWithName:@"electric_alert"];
        [self.collisionBehavior removeItem:self.square];
    
}

- (BOOL)prefersStatusBarHidden {return YES;}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end




















