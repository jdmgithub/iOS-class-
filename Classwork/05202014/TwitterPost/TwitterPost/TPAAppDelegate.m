//
//  TPAAppDelegate.m
//  TwitterPost
//
//  Created by Jisha Obukwelu on 5/22/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TPAAppDelegate.h"
#import "TPAViewController.h"

@implementation TPAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.window.rootViewController = [[TPAViewController alloc]initWithNibName:nil bundle:nil];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
