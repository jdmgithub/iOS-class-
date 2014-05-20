//
//  IOSColorsView.m
//  iOSHomework
//
//  Created by Jisha Obukwelu on 5/18/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "IOSColorsView.h"

@implementation IOSColorsView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Initialization code
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
