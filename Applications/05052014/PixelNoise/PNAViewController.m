//
//  PNAViewController.m
//  PixelNoise
//
//  Created by Jisha Obukwelu on 5/5/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "PNAViewController.h"
#import "PNAPixelSounds.h"

@interface PNAViewController ()

@end

@implementation PNAViewController
{
    PNAPixelSounds * sounds;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        sounds = [[PNAPixelSounds alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {return YES;}


@end
