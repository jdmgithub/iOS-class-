//
//  RBATwoViewController.m
//  RedBlueApp
//
//  Created by Jisha Obukwelu on 5/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "RBARedViewController.h"
#import "RBABlueViewController.h"
#import "RBAPoints.h"

@interface RBARedViewController ()

@end

@implementation RBARedViewController
{
       int points;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    }

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    points += 1;
   [RBAPoints mainData].blueScore = points;
    NSLog(@"%d", [RBAPoints mainData].blueScore);
    [self.delegate addPoints];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
