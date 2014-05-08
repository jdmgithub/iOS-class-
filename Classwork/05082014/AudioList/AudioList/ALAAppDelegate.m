//
//  ALAAppDelegate.m
//  AudioList
//
//  Created by Jisha Obukwelu on 5/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "ALAAppDelegate.h"
#import "ALAiPadViewController.h"


@implementation ALAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController * nC = [[UINavigationController alloc]initWithNibName:nil bundle:nil];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        ALAiPadViewController * splitVC = [[ALAiPadViewController alloc] initWithNibName:nil bundle:nil];
        
        self.window.rootViewController = splitVC;
        
    } else {
        
        UITableViewController * tVC = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
        
        [nC pushViewController:tVC animated:NO];
        self.window.rootViewController = nC;
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
