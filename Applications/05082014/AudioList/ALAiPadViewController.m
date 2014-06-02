//
//  ALAViewController.m
//  AudioList
//
//  Created by Jisha Obukwelu on 5/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "ALAiPadViewController.h"
#import "ALAiPadTableViewController.h"
#import "ALAiPadDetailViewController.h"
#import "ALASoundCloudRequest.h"

@interface ALAiPadViewController () <UISplitViewControllerDelegate>

@end

@implementation ALAiPadViewController
{
    ALAiPadTableViewController * listVC;
    ALAiPadDetailViewController * detailVC;
    UINavigationController * nC;
    UITableViewController * songVC;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        detailVC = [[ALAiPadDetailViewController alloc]initWithNibName:nil bundle:nil];
        
        nC = [[UINavigationController alloc]initWithRootViewController:detailVC];
        
        listVC = [[ALAiPadTableViewController alloc] initWithStyle:UITableViewStylePlain];
        
        listVC.detailVC = detailVC;
        
        songVC = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
        
        UITabBarController *tabBar = [[UITabBarController alloc] init];
        [tabBar setViewControllers:@[listVC, songVC]];
        
        listVC.tabBarItem =[[UITabBarItem alloc] initWithTitle:@"PlayList"
                                                         image:[UIImage imageNamed:@"list"]
                                                           tag:0];
        
        
        songVC.tabBarItem =[[UITabBarItem alloc] initWithTitle:@"Songs"
                                                         image:[UIImage imageNamed:@"songs"]
                                                           tag:1];
        
        //list VC needs to have two tab options tracks or playlists at the bottom (pushViewController)
        //detailVC a play and stop bottom that will play from the stream URL (AV Foundation)
                
        self.viewControllers = @[tabBar, nC];
        
        self.presentsWithGesture = YES; // does not hurt to leave in, in case its changed by Apple
        
        self.delegate = self;
        
        [ALASoundCloudRequest updateData];
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
   
    nC.navigationBarHidden = YES;

}

@end
