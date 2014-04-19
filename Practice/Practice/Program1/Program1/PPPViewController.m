//
//  PPPViewController.m
//  Program1
//
//  Created by Jisha Obukwelu on 4/19/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "PPPViewController.h"

@interface PPPViewController ()

@end

@implementation PPPViewController
{
    UILabel * writingLabel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        writingLabel = [[UILabel alloc] initWithFrame:CGRectMake(10h, 0, 320, 100)];
        writingLabel.font = [UIFont fontWithName:(@"Times New Roman") size:(12)];
        writingLabel.textAlignment = NSTextAlignmentJustified;
        [writingLabel  setText:@"PROGRAMMING IS FUN!"];
        [self.view addSubview:writingLabel];
        NSLog(@"Programming is fun");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
