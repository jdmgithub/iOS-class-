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

@property (nonatomic) AVAudioPlayer * player;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic) UIGravityBehavior * gravityBehavior;
@property (nonatomic) UICollisionBehavior * collisionBehavior;
@property (nonatomic) UIView * square;
@property (nonatomic) UIAttachmentBehavior * attacher;
@property (nonatomic) NSMutableArray * squares;
@property (nonatomic) UIDynamicItemBehavior * squareDynamicsProperties;

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
        sounds = [[PNAPixelSounds alloc] init];
        self.squares = [@[]mutableCopy];
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
    self.square.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:self.square];
    
    [self.squares addObject:self.square];

    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.gravityBehavior = [[UIGravityBehavior alloc] initWithItems:self.squares];
    [self.animator addBehavior:self.gravityBehavior];
    
    self.collisionBehavior = [[UICollisionBehavior alloc] initWithItems:self.squares];
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    self.collisionBehavior.collisionDelegate = self;
    
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;
    
   
    [self.collisionBehavior addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0,h+10)
                                              toPoint:CGPointMake(w, h+10)];
    
    [self.animator addBehavior:self.collisionBehavior];
    
    self.squareDynamicsProperties = [self createPropertiesForItems:self.squares];
    self.squareDynamicsProperties.density = 200000;
    self.squareDynamicsProperties.elasticity = 1.0;
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


- (void)playSoundWithName:(NSString *)soundName
{
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    NSURL * url = [[NSURL alloc] initFileURLWithPath:file];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [self.player play];
}

- (UIDynamicItemBehavior*)createPropertiesForItems:(NSArray *)squares
{
    UIDynamicItemBehavior * properties = [[UIDynamicItemBehavior alloc] initWithItems:squares];
    properties.allowsRotation = YES;
    properties.friction = 0.0;
    properties.elasticity = 1.0;
    properties.density = 10;
    [self.animator addBehavior:properties];
    return properties;//must return something
}

- (BOOL)prefersStatusBarHidden {return YES;}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
