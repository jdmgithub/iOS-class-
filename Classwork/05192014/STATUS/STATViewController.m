//
//  STATViewController.m
//  STATUS
//
//  Created by Jisha Obukwelu on 5/19/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "STATViewController.h"
#import "STATYellowSmileyVC.h"
#import "STATSmileySingle.h"


@interface STATViewController ()
@property (nonatomic) NSMutableArray *squares;
@property (nonatomic) NSMutableArray * colors;


@end

@implementation STATViewController
{
    UIView * buttonFrame;
    UIButton * forwardButton;
    STATYellowSmileyVC * smileyVC;
    NSArray * buttonImages;
    UIButton * colorSquare;
    UIImageView * selectedFrame;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    { }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    buttonFrame = [[UIView alloc]initWithFrame:CGRectMake (56, 180, 192, 192)];
    buttonFrame.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:buttonFrame];
    
    
    forwardButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 415, 48, 56)];
    [forwardButton setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
    [forwardButton addTarget:self action:@selector(goToSmileyPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forwardButton];
    
    [self addImage];
    
    selectedFrame = [[UIImageView alloc] initWithFrame:CGRectMake( - 8, - 8, 64, 64)];
    selectedFrame.image = [UIImage imageNamed:@"squares"];

}


- (void)addImage
{
    buttonImages = @[[UIImage imageNamed:@"colors_1"],
                     [UIImage imageNamed:@"colors_2"],
                     [UIImage imageNamed:@"colors_3"],
                     [UIImage imageNamed:@"colors_4"],
                     [UIImage imageNamed:@"colors_5"],
                     [UIImage imageNamed:@"colors_6"],
                     [UIImage imageNamed:@"colors_7"],
                     [UIImage imageNamed:@"colors_8"],
                     [UIImage imageNamed:@"colors_9"],
                     ];
    
    float brickWidth = 48;
    
    //create squares
    for(int row=0; row <3; row++)
    {
        for (int col = 0; col <3; col++)
        {
            float brickX = ((brickWidth +16) * col)+8;
            float brickY = ((brickWidth +16) * row)+8;
            
            int index = (row * 3) +col;
            
            int colorIndex = (row * 3) + col;
            
            colorSquare = [[UIButton alloc] initWithFrame:CGRectMake(brickX, brickY, 48, 48)];
            [colorSquare setImage:buttonImages[index] forState:UIControlStateNormal];
            [colorSquare setTag:colorIndex];
            [buttonFrame addSubview:colorSquare];
            [self.colors addObject:colorSquare];
            [colorSquare addTarget:self action:@selector(figureOutSelector:) forControlEvents:UIControlEventTouchUpInside];
        }}
}

- (void)figureOutSelector: (UIButton *)sender
{
    NSLog(@"%i",sender.tag);
    [sender insertSubview:selectedFrame atIndex:0];
    [STATSmileySingle singleton].colors = (int)sender.tag;
}

- (void)goToSmileyPage
{
    smileyVC = [[STATYellowSmileyVC alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:smileyVC animated:YES];
    
    self.navigationController.navigationBarHidden = YES;
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
