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
    DLAStageScribble * scribbleView;
    
    UIView * colorsDrawer;
    
    float lineWidth;
    
    UIColor * lineColor;
    
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
    
    lineColor = [UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f],
    lineWidth = 5.0;

    [self toggleStage];
    
    [self.view addSubview:scribbleView];
    
    UISlider * slider = [[UISlider alloc] initWithFrame:CGRectMake(30, 380, 280, 23)];
    
    slider.minimumValue = 2.0;
    slider.maximumValue = 20.0;
    slider.value = lineWidth;
    
    [slider addTarget:self action:@selector(changeLineWidth:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];

    
    colorsDrawer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    
    NSArray * colors = @[
                         [UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f],
                         [UIColor colorWithRed:0.008f green:0.353f blue:0.431f alpha:1.0f],
                         [UIColor colorWithRed:0.016f green:0.604f blue:0.671f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.988f blue:0.910f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.298f blue:0.153f alpha:1.0f]
                         ];
    float buttonWidth = SCREEN_WIDTH/ [colors count];
    
    for(UIColor * color in colors)
    {
        int index = [colors indexOfObject:color];
        
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(buttonWidth * index, 0, buttonWidth, 40)];
        
        button.backgroundColor = color;
        [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
        
        [colorsDrawer addSubview:button];
    }
    [self.view addSubview:colorsDrawer];
    
    
    UIButton * toggleButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 420, 50, 50)];
    toggleButton.backgroundColor = [UIColor orangeColor];
    [toggleButton   addTarget:self action:@selector(toggleStage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:toggleButton];
    
    UIButton * undoButton = [[UIButton alloc] initWithFrame:CGRectMake(135, 420, 50, 50)];
    undoButton.backgroundColor = [UIColor lightGrayColor];
    [undoButton   addTarget:self action:@selector(undoStage) forControlEvents:UIControlEventTouchUpInside];
    [undoButton setImage:[UIImage imageNamed:@"UndoButton"] forState:UIControlStateNormal];
    [self.view addSubview:undoButton];
    
    
    UIButton * clearButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 420, 50, 50)];
    clearButton.backgroundColor = [UIColor redColor];
    [clearButton   addTarget:self action:@selector(clearStage) forControlEvents:UIControlEventTouchUpInside];
    [clearButton setImage:[UIImage imageNamed:@"Delete"] forState:UIControlStateNormal];
    [self.view addSubview:clearButton];

}

- (void)toggleStage
{
    NSMutableArray * lines = scribbleView.lines;
    
    [scribbleView removeFromSuperview];
    
    if([scribbleView isMemberOfClass:[DLAStageScribble class]])
    {
        
        scribbleView = [[DLAStageLines alloc] initWithFrame:self.view.frame];
        
    }else {
        
        scribbleView = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
    }
    
    scribbleView.lineWidth = lineWidth;
    scribbleView.lineColor = lineColor;
    
    if (lines != nil)scribbleView.lines = lines;
    
    [self.view insertSubview:scribbleView atIndex:0];
}

- (void)changeLineWidth:(UISlider *)sender
{
        lineWidth = sender.value;
        scribbleView.lineWidth = lineWidth;
}

- (void)changeColor: (UIButton *)sender
{
    lineColor = sender.backgroundColor;
    scribbleView.lineColor = lineColor;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)undoStage
{
    [scribbleView undoStage];
}

- (void)clearStage
{
    [scribbleView clearStage];
}



@end

