//
//  LPAAppDelegate.m
//  LilPlayA
//
//  Created by Jisha Obukwelu on 5/13/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "LPAAppDelegate.h"
#import "LPAViewController.h"

@implementation LPAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
     LPAViewController * vC = [[LPAViewController alloc] init];
    
    self.window.rootViewController = vC;

    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
