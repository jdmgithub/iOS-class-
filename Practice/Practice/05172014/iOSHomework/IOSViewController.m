//
//  IOSViewController.m
//  iOSHomework
//
//  Created by Jisha Obukwelu on 5/18/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "IOSViewController.h"
#import "IOSTVCTableViewController.h"


@interface IOSViewController ()

@end

@implementation IOSViewController
{
    UIButton * launchButton;
    IOSTVCTableViewController * iosTVC;
    UINavigationController * nc;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.view.backgroundColor = [UIColor yellowColor];
        
        launchButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 150, 100, 100)];
        launchButton.layer.cornerRadius = 50;
        [launchButton setTitle:@"LAUNCH" forState:UIControlStateNormal];
        launchButton.backgroundColor = [UIColor magentaColor];
        launchButton.titleLabel.font = [UIFont fontWithName:@"HELVETICANEUE" size:20];
        [launchButton addTarget:self action:@selector(launchNC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:launchButton];

    }
    return self;
}

- (void)launchNC
{
    [launchButton removeFromSuperview];
    
    iosTVC = [[IOSTVCTableViewController alloc] initWithStyle:UITableViewStylePlain];
    nc = [[UINavigationController alloc]initWithRootViewController:iosTVC];
    [self.navigationController pushViewController:iosTVC animated:YES];
    
    self.navigationController.toolbarHidden = NO;
    self.navigationController.navigationBarHidden = NO;
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

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
