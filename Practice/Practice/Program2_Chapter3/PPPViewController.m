//
//  PPPViewController.m
//  Program2_Chapter3
//
//  Created by Jisha Obukwelu on 4/19/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "PPPViewController.h"

@interface PPPViewController ()
{
    int numerator;
    int denominator;
    Fract * myFraction;
}

- (void)print;
- (void)setNumerator: (int)n;
- (void)setDenominator: (int)d;

@end

@implementation PPPViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        NSLog(@"notes: Oven - Warm food, bake, clean");
        NSlog(@"-(void)warmFood; \n -(void)bakeFood; \n -(void)cleanOven");
        
    }
    return self;
}

- (void)print
{
    NSLog(@"%i/%i", numerator, denominator);
}

- (void)setNumerator: (int)n
{
    numerator = n;
}

- (void)setDenominator: (int)d
{
    denominator = d;
}

- (void)getMyFraction
{
    

}
@end
