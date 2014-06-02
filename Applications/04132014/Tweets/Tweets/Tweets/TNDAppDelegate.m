//
//  TNDAppDelegate.m
//  Tweets
//
//  Created by Jisha Obukwelu on 4/13/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TNDAppDelegate.h"
#import "TNDTweetsTVC.h"

@implementation TNDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [[TNDTweetsTVC alloc] initWithStyle: UITableViewStylePlain];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
