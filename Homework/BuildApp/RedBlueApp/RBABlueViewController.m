//
//  RBAThreeViewController.m
//  RedBlueApp
//
//  Created by Jisha Obukwelu on 5/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "RBABlueViewController.h"
#import "RBARedViewController.h"
#import "RBAPoints.h"

@interface RBABlueViewController ()

@end

@implementation RBABlueViewController
{
    int points;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    points += 1;
    [RBAPoints mainData].redScore = points;
    NSLog(@"%d", [RBAPoints mainData].redScore);
}



@end
