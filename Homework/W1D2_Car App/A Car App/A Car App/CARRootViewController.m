//
//  CARRootViewController.m
//  A Car App
//
//  Created by Jisha Obukwelu on 4/1/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "CARRootViewController.h"
#import "CARWheel.h"
#import "CARBumper.h"
#import "CARWindow.h"
#import "CARIgnition.h"
#import "CarGas.h"
#import "CARBrake.h"


@interface CARRootViewController ()

@end

@implementation CARRootViewController

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
    
    CARWheel * wheel1 = [[CARWheel alloc] init];
    wheel1.frame =CGRectMake(24, 300, 40, 40);
    wheel1.tirePressure = 30;
    [self.view addSubview:wheel1];
    
    CARWheel * wheel2 = [[CARWheel alloc] init];
    wheel2.frame =CGRectMake(24, 20, 40, 40);
    wheel2.tirePressure = 30;
    [self.view addSubview:wheel2];
    
    CARWheel * wheel3 = [[CARWheel alloc] init];
    wheel3.frame =CGRectMake(250, 300, 40, 40);
    wheel3.tirePressure = 30;
    [self.view addSubview:wheel3];
    
    CARWheel * wheel4 = [[CARWheel alloc] init];
    wheel4.frame =CGRectMake(250, 20, 40, 40);
    wheel4.tirePressure = 30;
    [self.view addSubview:wheel4];

    CARWindow * windshield = [[CARWindow alloc] init];
    windshield.frame =CGRectMake(113, 300, 100, 40);
    [self.view addSubview:windshield];
    
    CARWindow * window1 = [[CARWindow alloc] init];
    window1.frame =CGRectMake(24, 260, 40, 40);
    [self.view addSubview:window1];
    
    CARWindow * window2 = [[CARWindow alloc] init];
    window2.frame =CGRectMake(24, 60, 40, 40);
    [self.view addSubview:window2];

    CARWindow * window3 = [[CARWindow alloc] init];
    window3.frame =CGRectMake(250, 260, 40, 40);
    [self.view addSubview:window3];

    CARWindow * window4 = [[CARWindow alloc] init];
    window4.frame =CGRectMake(250, 60, 40, 40);
    [self.view addSubview:window4];

    CARGas * gasPedal = [[CARGas alloc] init];
    gasPedal.frame = CGRectMake(120, 260, 40,40);
    [gasPedal setTitle:@"Start" forState:UIControlStateNormal];
    [gasPedal addTarget:(self) action:@selector (pressGasPedal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gasPedal];
    gasPedal.alpha = 0.5;
    
    CARBrake * brake = [[CARBrake alloc] init];
    brake.frame = CGRectMake(160, 260, 40, 40);
    [brake setTitle:@"Stop" forState:UIControlStateNormal];
    [brake addTarget:(self) action:@selector (pressBrake) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:brake];
    
    CARIgnition* ignition = [[CARIgnition alloc] init];
    ignition.frame = CGRectMake(200, 260, 35,35);
    [ignition setTitle:@"ON" forState:UIControlStateNormal];
    [ignition addTarget:(self) action:@selector (turnIgnition) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ignition];
    
}

- (void)pressGasPedal
{
    NSLog(@"pressed gas");
    
}

- (void)pressBrake
{
    NSLog(@"pressed brake");
}

- (void)turnIgnition
{
    NSLog(@"turn ignition");
}

@end
