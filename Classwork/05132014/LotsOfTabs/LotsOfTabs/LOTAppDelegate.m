//
//  LOTAppDelegate.m
//  LotsOfTabs
//
//  Created by Jisha Obukwelu on 5/13/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "LOTAppDelegate.h"

@implementation LOTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Version 1: UITabBarController
    UITabBarController * tbc = [[UITabBarController alloc] init];
    
    UITableViewController * tvc = [[UITableViewController alloc]init];
    
    UIViewController * vc = [[UIViewController alloc]init];
    
    [tbc setViewControllers:@[tvc, vc] animated:YES];
    
    tvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"TVC" image:nil tag:0];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"VC" image:nil tag:1];
    
    
    [tvc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(10, -20)];
    [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(-10, -20)];
    
    self.window.rootViewController = tbc;
    
    // Version 2: UIToolBar in UINavigationController
    
    UINavigationController * nc = [[UINavigationController alloc]init];
    
    nc.toolbarHidden = NO;
    
    UIBarButtonItem * button1 = [[UIBarButtonItem alloc] initWithTitle:@"Tracks" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
     UIBarButtonItem * button2 = [[UIBarButtonItem alloc] initWithTitle:@"Playlists" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    UIBarButtonItem * flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [nc.toolbar setItems:@[flexible, button1, flexible, button2, flexible] animated:YES];
    
    self.window.rootViewController = nc;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
