//
//  SCGStageVC.m
//  Squares
//
//  Created by Jisha Obukwelu on 4/11/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "SCGStageVC.h"
#import "SCGCircle.h"
#import "SCGSquare.h"

@interface SCGStageVC ()

@end

@implementation SCGStageVC
{
    int gameSize;
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
//self.view for the ViewController actually loads on the screen
{
    [super viewDidLoad];
    gameSize = 6;
    
    float circleWidth = SCREEN_WIDTH / gameSize;
    
    for (float i = 0.0; i < gameSize * gameSize; i++) {
        NSLog(@"i = %f", i);
        
        float decimal = floor((i / gameSize) * 100) / 100.0;
        
        int row = floor(decimal);
        int col = ceil( (decimal- floorf(decimal) ) * gameSize);
        
        NSLog(@"i / gameSize = %f", i / gameSize);
        
        NSLog(@"i : %f --- row : %d --- col : %d", i,row,col);
        
        float circleX = circleWidth * col;
        float circleY = (circleWidth * row) + ((SCREEN_HEIGHT - SCREEN_WIDTH)/2);
        
        SCGCircle * circle = [[SCGCircle alloc] initWithFrame: CGRectMake(circleX, circleY, circleWidth, circleWidth)];
        
        circle.position = i;
        [self.view addSubview:circle];
    };
}

- (BOOL)prefersStatusBarHidden {return YES;}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
