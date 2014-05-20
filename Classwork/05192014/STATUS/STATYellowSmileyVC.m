//
//  STATSmileyVC.m
//  STATUS
//
//  Created by Jisha Obukwelu on 5/19/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "STATYellowSmileyVC.h"
#import "STATChosenVC.h"
#import "STATSmileySingle.h"
#import "STATViewController.h"

@interface STATYellowSmileyVC ()
@property (nonatomic) NSMutableArray * smilies;

@end

@implementation STATYellowSmileyVC
{
    UIView * smileyFrame;
    UIButton * forwardButton;
    STATYellowSmileyVC * smileyVC;
    NSArray * ySmileyImages;
    NSArray * rSmileyImages;
    UIButton * smileySquare;
    UIImageView * selectedFrame;
    STATChosenVC * chosenVC;
    UIButton * backButton;
    STATViewController * colorsVC;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
    }
return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    smileyFrame = [[UIView alloc]initWithFrame:CGRectMake (56, 180, 192, 192)];
    smileyFrame.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:smileyFrame];
    
    backButton = [[UIButton alloc] initWithFrame:CGRectMake(56, 415, 48, 56)]; //120, 415, 48, 56
    [backButton setImage:[UIImage imageNamed:@"arrow1"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    forwardButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 415, 48, 56)]; //120, 415, 48, 56
    [forwardButton setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [forwardButton addTarget:self action:@selector(goToSmileyPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forwardButton];
    
    selectedFrame = [[UIImageView alloc] initWithFrame:CGRectMake( - 8, - 8, 64, 64)];
    selectedFrame.image = [UIImage imageNamed:@"squares"];
    
    ySmileyImages = @[[UIImage imageNamed:@"smilies_1"],[UIImage imageNamed:@"smilies_2"],[UIImage imageNamed:@"smilies_3"],
                      [UIImage imageNamed:@"smilies_4"],[UIImage imageNamed:@"smilies_5"],[UIImage imageNamed:@"smilies_6"],
                      [UIImage imageNamed:@"smilies_7"],[UIImage imageNamed:@"smilies_8"],[UIImage imageNamed:@"smilies_9"],
                      ];
    
    rSmileyImages = @[[UIImage imageNamed:@"angry_1"],[UIImage imageNamed:@"angry_2"],[UIImage imageNamed:@"angry_3"],
                      [UIImage imageNamed:@"angry_4"],[UIImage imageNamed:@"angry_5"],[UIImage imageNamed:@"angry_6"],
                      [UIImage imageNamed:@"angry_7"],[UIImage imageNamed:@"angry_8"],[UIImage imageNamed:@"angry_9"],
                      ];
    
    float squareWidth = 48;
    
    //create squares
    for(int row=0; row <3; row++)
    {
        for (int col = 0; col <3; col++)
        {
            float squareX = ((squareWidth +16) * col)+8;
            float squareY = ((squareWidth +16) * row)+8;
            
            int index = (row * 3) +col;
            
            smileySquare = [[UIButton alloc] initWithFrame:CGRectMake(squareX, squareY, 48, 48)];
            
            smileySquare.tag = index;
            
            [smileySquare addTarget:self action:@selector(figureOutSelector:) forControlEvents:UIControlEventTouchUpInside];
            
            if ([STATSmileySingle singleton].colors == 0) {
                
                [smileySquare setImage:ySmileyImages[index] forState:UIControlStateNormal];
                
            } else if ([STATSmileySingle singleton].colors == 1) {
                
                [smileySquare setImage:rSmileyImages[index] forState:UIControlStateNormal];
            }
            
            [smileyFrame addSubview:smileySquare];
            [self.smilies addObject:smileySquare];
        }}
}

- (void)figureOutSelector: (UIButton *)sender
{
    [sender insertSubview:selectedFrame atIndex:0];
    [STATSmileySingle singleton].bigSmiley = (int)sender.tag;
}

- (void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)goToSmileyPage
{
    chosenVC = [[STATChosenVC alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:chosenVC animated:YES];
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



