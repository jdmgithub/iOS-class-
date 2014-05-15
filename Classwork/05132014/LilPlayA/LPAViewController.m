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
    NSTimeInterval currentTime;
    NSTimeInterval duration;
    CGFloat progress;
    UIView * progressBar2;
    CGPoint location;
    
    
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
        
        playButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 100, 100, 100)];
        [playButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [playButton setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateSelected];
        playButton.layer.cornerRadius = 50;
        [self.view addSubview:playButton];
        
        stopButton = [[UIButton alloc] initWithFrame:CGRectMake(105, 350, 100, 100)];
        [stopButton setImage:[UIImage imageNamed:@"stop"] forState:UIControlStateNormal];
        stopButton.layer.cornerRadius = 50;
        [self.view addSubview:stopButton];
        
        progressBar = [[UIView alloc] initWithFrame:CGRectMake(5, 250, w- 20, 5)];
        progressBar.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:progressBar];
        
        progressBar2 = [[UIView alloc] initWithFrame:self.view.frame];
        progressBar2.backgroundColor = [UIColor clearColor];
        [progressBar addSubview:progressBar2];
        
        seekButton = [[UIView alloc]initWithFrame:CGRectMake(0, -10, 30, 30)];
        seekButton.layer.cornerRadius  = 15;
        seekButton.backgroundColor = [UIColor magentaColor];
        [progressBar addSubview:seekButton];
        
        songTimer = [[UILabel alloc] initWithFrame:CGRectMake(0, -55, 40, 20)];
        songTimer.font = [UIFont fontWithName:@"HELVETICANEUE-ULTRALIGHT" size:10];
        [seekButton addSubview:songTimer];
        
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
    
    seekButton.frame = CGRectMake(0, -10, 30, 30);
    seekButton.layer.cornerRadius = 15;
    [progressBar addSubview:seekButton];
    
    songTimer.frame = CGRectMake(0, -25, 40, 20);
    songTimer.text = [NSString stringWithFormat:@"0.00"];
    
    progressBar2.backgroundColor = [UIColor clearColor];
    
    playButton.selected = NO;
}

- (void)updateProgressBar:(NSTimer *)sender
{
    currentTime = [player currentTime];
    duration = [player duration];
    progress = currentTime/duration;
    
    float xPosition = progressBar.frame.origin.x + progress * progressBar.frame.size.width;
    xPosition = player.currentTime;
    
    seekButton.frame = CGRectMake(xPosition, -10, 30, 30);
    seekButton.layer.cornerRadius = 15;
    
    NSLog(@"%f", currentTime);
    
    songTimer.frame = CGRectMake(0, -25, 40, 20);
    songTimer.text = [NSString stringWithFormat:@"%0.02f, 0.02f",player.currentTime];
    songTimer.textAlignment = NSTextAlignmentLeft;
    
    progressBar2.frame = CGRectMake(0, 0, xPosition, 5);
    progressBar2.backgroundColor = [UIColor blackColor];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [countDown invalidate];
    [player pause];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
   [self moveMySeekButton:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self moveMySeekButton:touches];
    player.currentTime = location.x;
    [player play];
    
}

- (void)moveMySeekButton: (NSSet *)touches
{
    for (UITouch *touch in touches)
    {
        location = [touch locationInView:progressBar];
        seekButton.frame = CGRectMake(location.x, -10, 30, 30);
        seekButton.layer.cornerRadius = 15;
        
        songTimer.text = [NSString stringWithFormat:@"%0.02f",player.currentTime];
        
        progressBar2.frame = CGRectMake(0, 0, location.x, 5);
        progressBar2.backgroundColor = [UIColor blackColor];
    }
}

- (void)stopTimer
{
    [countDown invalidate];
    countDown = nil;
    player.currentTime = 0;
}

- (void)volumeControl
{
    player.volume = [volumeSlider value];
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
