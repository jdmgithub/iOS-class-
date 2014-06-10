//
//  iAddViewController.m
//  iAdd
//
//  Created by Jisha Obukwelu on 6/10/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "iAddViewController.h"
#import <iAd/iAd.h>

@interface iAddViewController ()

@end

@implementation iAddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.canDisplayBannerAds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
