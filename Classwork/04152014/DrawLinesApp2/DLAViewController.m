//
//  DLAViewController.m
//  DrawLinesApp
//
//  Created by Jisha Obukwelu on 4/15/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "DLAViewController.h"
#import "DLAStageLines.h"
#import "DLAStageScribble.h"

@interface DLAViewController ()

@end

@implementation DLAViewController
{
    UIButton * eraser;
    UIButton * button1;
    UIButton * button2;
    UIButton * button3;
    NSArray * lineColors;
    DLAStageScribble * scribbleView;
    UIView * colorsDrawer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    

    scribbleView = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
    [self.view addSubview:scribbleView];
    
    UISlider * slider = [[UISlider alloc] initWithFrame:CGRectMake(30, SCREEN_HEIGHT - 43, 280, 23)];
    
    slider.minimumValue = 2.0;
    slider.maximumValue = 20.0;
    
    [slider addTarget:self action:@selector(changeLineWidth:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];

    
    colorsDrawer = [[UIView alloc] initWithFrame:CGRectMake(170, 0, 120, 40)];
    colorsDrawer.layer.cornerRadius = button2.frame.size.width / 2.0;
    
    
    NSArray * colors = @[
                         [UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f],
                         [UIColor colorWithRed:0.016f green:0.604f blue:0.671f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.298f blue:0.153f alpha:1.0f]
                         ];
    
    float buttonWidth = 150/ [colors count];
    
    for(UIColor * color in colors)
    {
        int index = [colors indexOfObject:color];
        
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(buttonWidth * index, 0, buttonWidth, buttonWidth)];
        
        button.backgroundColor = color;
        [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
        
        [colorsDrawer addSubview:button];
    }
    [self.view addSubview:colorsDrawer];
    
    eraser = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 40, 40)];
    eraser.layer.cornerRadius = eraser.frame.size.width / 2.0;
    eraser.backgroundColor = [UIColor whiteColor];
    eraser.titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:10];
    [eraser setTitle:@"ERASER" forState:UIControlStateNormal];
    [eraser addTarget:self action:@selector (eraseLines:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:eraser];
    
}


-(void)changeLineWidth:(UISlider *)sender
{
    scribbleView.lineWidth = sender.value;
}


- (void)changeColor: (UIButton *)sender
{
    scribbleView.lineColor = sender.backgroundColor;
}

- (void)eraseLines:(UIButton *)sender
{
    scribbleView.lineWidth = 20.0;
    scribbleView.lineColor = [UIColor blackColor];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end

