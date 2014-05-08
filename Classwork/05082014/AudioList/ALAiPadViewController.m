//
//  ALAViewController.m
//  AudioList
//
//  Created by Jisha Obukwelu on 5/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "ALAiPadViewController.h"

@interface ALAiPadViewController () <UISplitViewControllerDelegate>

@end

@implementation ALAiPadViewController
{
    UITableViewController * listVC;
    UIViewController * detailVC;
    UINavigationController * nC;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        detailVC = [[UIViewController alloc]initWithNibName:nil bundle:nil];
        
        nC = [[UINavigationController alloc]initWithRootViewController:detailVC];
        
        listVC = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
        
        self.viewControllers = @[listVC, nC];
        
        self.presentsWithGesture = YES; // does not hurt to leave in, in case its changed by Apple
        
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
     barButtonItem.title = @"Button";
    
    detailVC.navigationItem.leftBarButtonItem = barButtonItem;
    
    detailVC.navigationController.navigationBarHidden = NO;
    
    nC.navigationBarHidden = NO;
    
}
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSLog(@"show");
    nC.navigationBarHidden = YES;

}

@end
