//
//  LPAViewController.m
//  LilPlayA
//
//  Created by Jisha Obukwelu on 5/13/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "LPAViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface LPAViewController ()

@end

@implementation LPAViewController
{
    AVAudioPlayer * player;
    UIView * progressBar;
    UIView * seekButton;
    NSTimer * countDown;
    UISlider * volumeSlider;
    UIButton * playButton;
    UIButton * stopButton;
    UILabel * songTimer;
    
    int h;
    int w;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
         w = [UIScreen mainScreen].bounds.size.width;
         h = [UIScreen mainScreen].bounds.size.height;
        
        playButton = [[UIButton alloc] initWithFrame:CGRectMake(10, (h-50)/2, 50, 50)];
        [playButton setImage:[UIImage imageNamed:@"button-play"] forState:UIControlStateNormal];
        [playButton setImage:[UIImage imageNamed:@"button-pause"] forState:UIControlStateSelected];
        playButton.layer.cornerRadius = 25;
        
        [self.view addSubview:playButton];
        
        stopButton = [[UIButton alloc] initWithFrame:CGRectMake(w - 60, (h-50)/2, 50, 50)];
        [stopButton setImage:[UIImage imageNamed:@"button-stop"] forState:UIControlStateNormal];
        stopButton.layer.cornerRadius = 25;
        [self.view addSubview:stopButton];
        
        songTimer = [[UILabel alloc] initWithFrame:CGRectMake(0, -25, 40, 20)];
        songTimer.font = [UIFont fontWithName:@"HELVETICANEUE-ULTRALIGHT" size:10];
        [progressBar addSubview:songTimer];
        
        progressBar = [[UIView alloc] initWithFrame:CGRectMake(70, (h-50)/2, w - 140, 4)];
        progressBar.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:progressBar];
        
        seekButton = [[UIView alloc]initWithFrame:CGRectMake(0, -10, 20, 20)];
        seekButton.layer.cornerRadius  = 10;
        seekButton.backgroundColor = [UIColor magentaColor];
        [progressBar addSubview:seekButton];

        
        volumeSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 50, 160, 10)];
        volumeSlider.minimumValue = 0.0;
        volumeSlider.maximumValue = 1.0;
        [volumeSlider addTarget:self action:@selector(volumeControl) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:volumeSlider];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long)NULL), ^{
            
            NSURL * url = [NSURL URLWithString:@"https://api.soundcloud.com/tracks/147445565/download?client_id=2d87025c8392069f828c446b965862e3" ];
            
            NSData * data = [NSData dataWithContentsOfURL:url];
            
            dispatch_async(dispatch_get_main_queue(), ^(void){
                
                player = [[AVAudioPlayer alloc] initWithData:data error:nil];
                [playButton addTarget:self action:@selector(startPlay:) forControlEvents:UIControlEventTouchUpInside];
                [stopButton addTarget:self action:@selector(stopPlay:) forControlEvents:UIControlEventTouchUpInside];
            });
        });
    }
    
    return self;
}

- (void)startPlay:(UIButton *)sender
{
    if (sender.selected == NO)
    {
        sender.selected = YES;
        [player play];
        countDown = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateProgressBar:) userInfo:nil repeats:YES];
        
    } else {
        sender.selected = NO;
        [player pause];
        [self stopTimer];
    }
}

- (void)stopPlay:(UIButton *)sender
{
    [player stop];
    [self stopTimer];
    seekButton.frame = CGRectMake(70, (h-61)/2, 20, 20);
    playButton.selected = NO;
}

- (void)volumeControl
{
    player.volume = [volumeSlider value];
}

- (void)updateProgressBar:(NSTimer *)sender
{
    NSTimeInterval currentTime = [player currentTime];
    NSTimeInterval duration = [player duration];
    CGFloat progress = currentTime/duration;
    
    float xPosition = progressBar.frame.origin.x + progress * progressBar.frame.size.width;
    
    seekButton.frame = CGRectMake(xPosition, -10, 20, 20);
    
    xPosition = player.currentTime;
    
    NSLog(@"%f", currentTime);
    
    songTimer.frame = CGRectMake(xPosition, -25, 40, 20);
    songTimer.text = [NSString stringWithFormat:@"%0.02f", currentTime];
    songTimer.textAlignment = NSTextAlignmentLeft;
    
}

- (void)stopTimer
{
    [countDown invalidate];
    countDown = nil;
    player.currentTime = 0;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [countDown invalidate];
    [player pause];

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        CGPoint location = [touch locationInView:progressBar];
        seekButton.frame = CGRectMake(location.x, (h-50)/2, 10, 10);

    }
     
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        CGPoint location = [touch locationInView:progressBar];
        seekButton.frame = CGRectMake(location.x, (h-50)/2, 10, 10);
        player.currentTime = location.x;
        [player play];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
