//
//  JONRootViewController.m
//  Notes
//
//  Created by Jisha Obukwelu on 4/1/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "JONRootViewController.h"
#import "JONUIView.h"

@interface JONRootViewController ()

@end

@implementation JONRootViewController

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
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    //CGRect rect = CGRectMake (30, 30, 160, 200);
    
    JONUIView * coolView = [[JONUIView alloc] init;
    
    coolView.coolTitle = @"This is red";
    
                            NSLog(@"%@", [coolView whatIsMyTitle]);
    
    [self.view addSubview: coolView];
    
    coolView.backgroundColor = [UIColor redColor];
    
    newView.coolTitle = @"This is blue";
    
    [self.view addSubview: coolView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
