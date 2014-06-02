//
//  SABViewController.m
//  StuffedAnimalBattale
//
//  Created by Jisha Obukwelu on 5/15/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "SABViewController.h"
#import <SpriteKit/SpriteKit.h>
#import "SABGameScene.h"

///Createa singleton for player health
///2 out of 3 wins to finish a game
/// tracks wins per player

///when a player is hit update singleton and also update health bar
///notificaiton of singleton delegate


@interface SABViewController ()

@end

@implementation SABViewController
{
    UIView * player2HPBar;
    
    float currentBarArea;
    float barArea;
}

- (id)init
{
    self  =[super init];
    if(self)
    {
        currentBarArea +=20;
        barArea = ((SCREEN_WIDTH - 60)/2.0) - 20;
        
        SKView * skView = [[SKView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self.view addSubview:skView];
        
        SABGameScene * skScene = [[SABGameScene alloc] initWithSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        
        [skView presentScene:skScene];
        
        UIButton * buttonA = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 105, SCREEN_HEIGHT - 80, 40, 40)];
        [buttonA addTarget:skScene action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        buttonA.backgroundColor = [UIColor lightGrayColor];
        buttonA.layer.cornerRadius = 20;
        [buttonA setTitle:@"A" forState:UIControlStateNormal];
        [self.view addSubview:buttonA];
        
        UIButton * buttonB = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 60, SCREEN_HEIGHT - 80, 40, 40)];
        [buttonB addTarget:skScene action:@selector(buttonClick2:) forControlEvents:UIControlEventTouchUpInside];
        buttonB.backgroundColor = [UIColor lightGrayColor];
        buttonB.layer.cornerRadius = 20;
        [buttonB setTitle:@"B" forState:UIControlStateNormal];
        [self.view addSubview:buttonB];
        
        UIButton * dpadUp = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2) - 230, SCREEN_HEIGHT - 155, 40, 40)];
        [dpadUp addTarget:skScene action:@selector(dpadUp:) forControlEvents:UIControlEventTouchUpInside];
        dpadUp.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:dpadUp];
        
        UIButton * dpadDown = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2- 230, SCREEN_HEIGHT - 75, 40, 40)];
        [dpadDown addTarget:skScene action:@selector(dpadDown:) forControlEvents:UIControlEventTouchUpInside];
        dpadDown.backgroundColor = [UIColor redColor];
        [self.view addSubview:dpadDown];
        
        UIButton * dpadLeft = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 270, SCREEN_HEIGHT - 115, 40, 40)];
        [dpadLeft addTarget:skScene action:@selector(dpadLeft:) forControlEvents:UIControlEventTouchUpInside];
        dpadLeft.backgroundColor = [UIColor greenColor];
        [self.view addSubview:dpadLeft];

        UIButton * dpadRight = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 190, SCREEN_HEIGHT - 115, 40, 40)];
        [dpadRight addTarget:skScene action:@selector(dpadRight:) forControlEvents:UIControlEventTouchUpInside];
        dpadRight.backgroundColor = [UIColor blueColor];
        [self.view addSubview:dpadRight];
        
        UILabel * timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(270, 10, 50, 50)];
        timerLabel.textColor = [UIColor redColor];
        [timerLabel setText:@"0.00"];
        timerLabel.font = [UIFont fontWithName:@"HELVETICANEUE" size:16];
        [self.view addSubview:timerLabel];
        
        self.player1HPBar = [[UIView alloc] initWithFrame:CGRectMake (10, 10, barArea, 30)];
        self.player1HPBar.backgroundColor = [UIColor greenColor];
        [self.view addSubview:self.player1HPBar];
        
        player2HPBar = [[UIView alloc] initWithFrame:CGRectMake (310, 10, 250, 30)];
        player2HPBar.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:player2HPBar];
    }
    return self;
}

- (void)decreaseHealthBar
{
    currentBarArea = barArea;
    currentBarArea -=10;
    self.player1HPBar = [[UIView alloc] initWithFrame:CGRectMake (10, 10, currentBarArea, 30)];
    self.player1HPBar.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.player1HPBar];
    
    [self.player1HPBar removeFromSuperview];
}


//float currentBarArea;
//currentBarArea = BarArea; in the init method
//currentBarArea -= 20;
//[player2HPbar removeFromParent];
//player2HPbar = [SKSpriteNode spriteNodeWithColor:[SKColor lightGrayColor] size:CGSizeMake((currentBarArea), 30)];
//player2HPbar.position = CGPointMake(SCREEN_WIDTH-(barArea + 20)/2.0, SCREEN_HEIGHT-20.0);
//[self addChild:player2HPbar];
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
