//
//  JOHViewController.m
//  W1D1 App
//
//  Created by Jisha Obukwelu on 3/31/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "JOHViewController.h"

@interface JOHViewController ()

@end

@implementation JOHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

- (IBAction)button1:(id)sender {
    self.label1.text = @"Jisha";
}

- (IBAction)button2:(id)sender {
    self.label2.text = self.label2a.text;
}

- (IBAction)button3:(id)sender {
    self.label3.textColor = [UIColor brownColor];
}
@end
