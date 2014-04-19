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

@interface BBAViewController () <BBALevelDelegate>

@end

@implementation BBAViewController
{
    BBALevelController * level;
    UIButton * startButton;
    UILabel * scoreBoard;
    UILabel * lifeCount;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        scoreBoard = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, 100, 40)];
        scoreBoard.textColor = [UIColor greenColor];
        scoreBoard.backgroundColor = [UIColor clearColor];
        scoreBoard.textAlignment = NSTextAlignmentRight;
        [self.view addSubview:scoreBoard];
        
        lifeCount = [[UILabel alloc] initWithFrame:CGRectMake(450, 0, 100, 40)];
        lifeCount.textColor = [UIColor greenColor];
        lifeCount.backgroundColor = [UIColor clearColor];
        lifeCount.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:lifeCount];

   
    }
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
    [startButton addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    startButton.titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:(60)];
    startButton.titleLabel.textColor = [UIColor whiteColor];

    [self.view addSubview:startButton];
    
    [scoreBoard removeFromSuperview];
}

- (void)startGame
{
    level = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
    level.delegate = self;
    
    level.view.frame = CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT-40);
    [self.view addSubview:level.view];
    
    [startButton removeFromSuperview];
    [level resetLevel];
}

- (void)addPoints:(int)points
{
    scoreBoard.text = [NSString stringWithFormat:@"%.d", points];
    [self.view addSubview:scoreBoard];
}

- (void)reduceLives:(int)lives
{
    lifeCount.text = [NSString stringWithFormat:@"%.d", lives];
    [self.view addSubview:lifeCount];
}
- (void)gameDone
{
    [level.view removeFromSuperview];
    [self.view addSubview:startButton];
    [scoreBoard removeFromSuperview];

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
