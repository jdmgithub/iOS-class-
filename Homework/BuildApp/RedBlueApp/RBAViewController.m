//
//  RBAViewController.m
//  RedBlueApp
//
//  Created by Jisha Obukwelu on 5/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "RBAViewController.h"
#import "RBARedViewController.h"
#import "RBABlueViewController.h"
#import "RBAPoints.h"

@interface RBAViewController () <RBARedDelegate, RBABlueDelegate>

@end

@implementation RBAViewController
{
    RBARedViewController * twoVC;
    RBABlueViewController * threeVC;
    UILabel * redScore;
    UILabel * blueScore;
    UILabel * totalScore;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        header.backgroundColor = [UIColor grayColor];
        [self.view addSubview:header];
        
        redScore = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, 40)];
        redScore.textColor = [UIColor blackColor];
        redScore.backgroundColor = [UIColor clearColor];
        redScore.textAlignment = NSTextAlignmentRight;
        redScore.text = @"Red Score = 0";
        redScore.font = [UIFont fontWithName:@"HELVETICA" size:10];
        [header addSubview:redScore];

        blueScore = [[UILabel alloc] initWithFrame:CGRectMake(350, 0, 100, 40)];
        blueScore.textColor = [UIColor blackColor];
        blueScore.backgroundColor = [UIColor clearColor];
        blueScore.textAlignment = NSTextAlignmentRight;
        blueScore.text = @"Blue Score = 0";
        blueScore.font = [UIFont fontWithName:@"HELVETICA" size:10];
        [header addSubview:blueScore];
        
        totalScore = [[UILabel alloc] initWithFrame:CGRectMake(160, 0, 100, 40)];
        totalScore.textColor = [UIColor blackColor];
        totalScore.backgroundColor = [UIColor clearColor];
        totalScore.textAlignment = NSTextAlignmentRight;
        totalScore.text = @"Total Score = 0";
        totalScore.font = [UIFont fontWithName:@"HELVETICA" size:10];
        [header addSubview:totalScore];

        
        UIButton * callTwoVCButton = [[UIButton alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT/4, 100, 100)];
        callTwoVCButton.layer.cornerRadius = 50;
        callTwoVCButton.backgroundColor = [UIColor redColor];
        [callTwoVCButton setTitle:@"RED TEAM" forState:UIControlStateNormal];
        callTwoVCButton.titleLabel.font = [UIFont fontWithName:@"HELVETICA" size:10];
        [callTwoVCButton addTarget:self action:@selector(callTwoVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:callTwoVCButton];
        
        UIButton * callThreeVCButton = [[UIButton alloc]initWithFrame:CGRectMake(350, SCREEN_HEIGHT/4, 100, 100)];
        callThreeVCButton.layer.cornerRadius = 50;
        callThreeVCButton.backgroundColor = [UIColor blueColor];
        [callThreeVCButton setTitle:@"BLUE TEAM" forState:UIControlStateNormal];
        callThreeVCButton.titleLabel.font = [UIFont fontWithName:@"HELVETICA" size:10];
        [callThreeVCButton addTarget:self action:@selector(callThreeVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:callThreeVCButton];
        
        UIButton * homeButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 0, 50, 50)];
        homeButton.imageView.image = [UIImage imageNamed:@"home"];
        homeButton.backgroundColor = [UIColor clearColor];
        homeButton.layer.masksToBounds = YES;
        [header addSubview:homeButton];
    }
    return self;
}

- (void)callTwoVC
{
    twoVC = [[RBARedViewController alloc] initWithNibName:nil bundle:nil];
    twoVC.delegate = self;
    [self.view addSubview:twoVC.view];
}

- (void)callThreeVC
{
    threeVC = [[RBABlueViewController alloc] initWithNibName:nil bundle:nil];
    threeVC.delegate = self;
    [self.view addSubview:threeVC.view];
    
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

- (void)addPoints
{
    redScore.text = [NSString stringWithFormat:@"Red Score : %d", [RBAPoints mainData].redScore];
    [self.view addSubview:redScore];
    
    blueScore.text = [NSString stringWithFormat:@"Blue Score : %d", [RBAPoints mainData].blueScore];
    [self.view addSubview:blueScore];
}

- (void)totalScore
{
    totalScore.text = [NSString stringWithFormat:@"Total Score: %d", [RBAPoints mainData].totalScore];
    [self.view addSubview:totalScore];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
