//
//  MAPAppDelegate.m
//  MAPS
//
//  Created by Jisha Obukwelu on 5/21/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "MAPAppDelegate.h"
#import "MAPViewController.h"

@implementation MAPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[MAPViewController alloc]initWithNibName:nil bundle:nil];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
