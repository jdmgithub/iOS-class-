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


@interface SABViewController ()

@end

@implementation SABViewController


- (id)init
{
    self  =[super init];
    if(self)
    {
        SKView * skView = [[SKView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self.view addSubview:skView];
        
        SABGameScene * skScene = [[SABGameScene alloc] initWithSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        
        [skView presentScene:skScene];

    }
    return self;
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
