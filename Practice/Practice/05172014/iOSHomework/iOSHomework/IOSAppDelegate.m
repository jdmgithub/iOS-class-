//
//  IOSAppDelegate.m
//  iOSHomework
//
//  Created by Jisha Obukwelu on 5/17/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "IOSAppDelegate.h"
#import "IOSTVCTableViewController.h"
#import "IOSViewController.h"


@implementation IOSAppDelegate
{
    UIButton * launchButton;
    IOSTVCTableViewController * iosTVC;
    IOSViewController * launchVC;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   
    launchVC = [[IOSViewController alloc]initWithNibName:nil bundle:nil];
    UINavigationController * nc = [[UINavigationController alloc]initWithRootViewController:launchVC];
    self.window.rootViewController = nc;
    
    nc.toolbarHidden = YES;
    nc.navigationBarHidden = YES;
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}




@end
