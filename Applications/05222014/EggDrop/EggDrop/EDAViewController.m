//
//  EDAViewController.m
//  EggDrop
//
//  Created by Jisha Obukwelu on 5/22/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "EDAViewController.h"
#import <CoreMotion/CoreMotion.h>
#import <AVFoundation/AVFoundation.h>

@interface EDAViewController ()
@property (nonatomic) AVAudioPlayer * player;
@property (nonatomic) CGRect originalEgg;
@property (nonatomic) CGRect originalSpoon;

@end

@implementation EDAViewController
{
    CMMotionManager * mManager;
    BOOL eggIsFalling;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.originalEgg = self.egg.frame;
    self.originalSpoon = self.spoon.frame;

    mManager = [[CMMotionManager alloc]init];
	
    [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        
        float roll = motion.attitude.roll * 10;
        
        if(!eggIsFalling) self.egg.frame = CGRectOffset(self.egg.frame,roll,0);
        
        float eggMidX = CGRectGetMidX(self.egg.frame);
        float spoonMidX = CGRectGetMidX(self.spoon.frame);
        
        //in both directions need positive number
        
        if (fabs(spoonMidX - eggMidX) > self.egg.frame.size.width/2.0 && !eggIsFalling) {
            
            eggIsFalling = YES;
            
            [UIView animateWithDuration:0.3 animations:^{
                
                float x = self.egg.frame.origin.x + self.egg.frame.size.width/4.0;
                float y = self.egg.frame.origin.y + self.egg.frame.size.height/4.0;
                float w = self.egg.frame.size.width/2.0;
                float h = self.egg.frame.size.height/2.0;
                
                self.egg.frame = CGRectMake(x, y, w, h);
            }completion:^(BOOL finished) {
                
                self.egg.image = [UIImage imageNamed:@"babychick3"];
                [self playSoundWithName:@"babychicks"];
            }];}}];
    
    UIButton * resetGame = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 60, 50)];
    [resetGame setImage:[UIImage imageNamed:@"egg"] forState:UIControlStateNormal] ;
    [resetGame addTarget:self action:@selector(resetLevel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetGame];
    
    UILabel * resetLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 50)];
    resetLabel.backgroundColor = [UIColor clearColor];
    resetLabel.text = @"RESET";
    resetLabel.textColor = [UIColor blackColor];
    resetLabel.font = [UIFont fontWithName:@"HELVETICANEUE" size:10];
    resetLabel.textAlignment = NSTextAlignmentCenter;
    [resetGame addSubview:resetLabel];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self moveMySpoon:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self moveMySpoon:touches];
}

- (void)moveMySpoon: (NSSet *)touches
{
    for (UITouch *touch in touches)
    {
        CGPoint location = [touch locationInView:self.view];
        self.spoon.frame = CGRectMake(location.x - (self.spoon.frame.size.width/2.0), self.spoon.frame.origin.y, self.spoon.frame.size.width, self.spoon.frame.size.height);
    }
}

- (void)playSoundWithName: (NSString *)soundName
{
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    NSURL * url = [[NSURL alloc]initFileURLWithPath:file];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player play];
}

- (void)resetLevel
{
    eggIsFalling = NO;
    self.egg.image = [UIImage imageNamed:@"egg"];
    self.egg.frame = self.originalEgg;
    self.spoon.frame = self.originalSpoon;
}

@end

//  self.egg.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
//  self.egg.frame = CGRectOffset(self.egg.frame, self.egg.frame.size.width/4, self.egg.frame.size.height/4);

