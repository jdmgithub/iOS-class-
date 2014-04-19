//
//  PPPAppDelegate.m
//  Program1
//
//  Created by Jisha Obukwelu on 4/19/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "PPPAppDelegate.h"
#import "PPPViewController.h"

@implementation PPPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[PPPViewController alloc] initWithNibName:nil bundle:nil];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
