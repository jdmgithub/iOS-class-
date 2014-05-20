//
//  STATAppDelegate.m
//  STATUS
//
//  Created by Jisha Obukwelu on 5/19/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "STATAppDelegate.h"
#import "STATViewController.h"
#import "STTwitter.h"

@implementation STATAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    STATViewController * colorChoice = [[STATViewController alloc]initWithNibName:nil bundle:nil];
    
    UINavigationController * nc = [[UINavigationController alloc]initWithRootViewController:colorChoice];
    
    self.window.rootViewController = nc;
    
    nc.toolbarHidden = YES;
    nc.navigationBarHidden = NO;
    
       
       
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
