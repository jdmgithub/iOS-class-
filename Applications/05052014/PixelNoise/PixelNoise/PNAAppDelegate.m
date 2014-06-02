//
//  PNAAppDelegate.m
//  PixelNoise
//
//  Created by Jisha Obukwelu on 5/5/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "PNAAppDelegate.h"
#import "PNAViewController.h"
#import "PNAPixelWorldController.h"
#import "PNAWorld2Controller.h"

@implementation PNAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[PNAWorld2Controller alloc] initWithNibName:nil bundle:nil];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
