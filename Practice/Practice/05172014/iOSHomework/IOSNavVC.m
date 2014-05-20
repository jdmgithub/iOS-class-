//
//  IOSNavVC.m
//  iOSHomework
//
//  Created by Jisha Obukwelu on 5/17/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "IOSNavVC.h"

@interface IOSNavVC ()

@end

@implementation IOSNavVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor greenColor];
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
