//
//  PPAAppDelegate.m
//  PullPick
//
//  Created by Jisha Obukwelu on 4/30/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "PPAAppDelegate.h"
#import "PPAViewController.h"

@implementation PPAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.rootViewController = [[PPAViewController alloc]initWithNibName:nil bundle:nil];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
