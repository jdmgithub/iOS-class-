//
//  BBAViewController.m
//  BrickBreaker
//
//  Created by Jisha Obukwelu on 4/17/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "BBAViewController.h"
#import "BBALevelController.h"
#import "MOVE.h"

@interface BBAViewController ()

@end

@implementation BBAViewController
{
    BBALevelController * level;
    UIButton * startButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    level =[[BBALevelController alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview:level.view];
    
    startButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, (SCREEN_HEIGHT-200)/2,200,200)];
    startButton.layer.cornerRadius = 100;
    startButton.backgroundColor = [UIColor grayColor];
    [startButton setTitle:@"START" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(goLevelScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    startButton.titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:(60)];
    startButton.titleLabel.textColor = [UIColor whiteColor];

    [self.view addSubview:startButton];
}

- (void)goLevelScreen
{
    [startButton removeFromSuperview];
    
    [level resetLevel];
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
