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
    
//    UILabel * lifeCount1;
//    UILabel * lifeCount2;
//    UILabel * lifeCount3;
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

//        lifeCount1 = [[UILabel alloc] initWithFrame:CGRectMake(395, 10, 20, 20)];
//        lifeCount1.layer.cornerRadius = 10;
//        lifeCount1.backgroundColor = [UIColor greenColor];
//        [self.view addSubview:lifeCount1];
//        
//        lifeCount2 = [[UILabel alloc] initWithFrame:CGRectMake(425, 10, 20, 20)];
//        lifeCount2.layer.cornerRadius = 10;
//        lifeCount2.backgroundColor = [UIColor greenColor];
//        [self.view addSubview:lifeCount2];
//        
//        lifeCount3 = [[UILabel alloc] initWithFrame:CGRectMake(455, 10, 20, 20)];
//        lifeCount3.layer.cornerRadius = 10;
//        lifeCount3.backgroundColor = [UIColor greenColor];
//        [self.view addSubview:lifeCount3];


    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    NSUserDefaults * userDefaults = [[NSUserDefaults standardUserDefaults];
//                                     
//    int defaultTopScore =[[NSUserDefaults standardUserDefaults]];
//    topScore = [[userDefaults objectForKey:@"topScore"] intValue];
    
//    header = [[BBAHeader alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
//    header.topScore = topScore;
//    [header showStart];
//    [self.view addSubview:header];
    
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
//
//- (void)updatePoints:(int)points
//{
//    scoreBoard.currentScore = points;
//    if (scoreBoard.currentScore > topScore)
//    {
//        topScore - scoreBoard.currentScore;
//        newHighScore = YES;
//        //update my default value
//        
//        NSUserDefaults * userDefaults = [[NSUserDefaults standardUserDefaults];
//        [userDefault setObject: @(topSCore) forKey:@"topScore"];
//        [userDefaults synchronize];
//    }
//}

//- (int)loseLife
//{
//    if(lives > 0) lives --;
//    header.livesLeft = lives;
//    if(lives == 0)[self.gameLost];
//    return lives;
//}

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
