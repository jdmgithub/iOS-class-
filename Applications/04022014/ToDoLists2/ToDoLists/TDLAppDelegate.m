//
//  TDLAppDelegate.m
//  ToDoLists
//
//  Created by Jisha Obukwelu on 4/2/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLAppDelegate.h"
#import "TDLTableViewController.h"

@implementation TDLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    TDLTableViewController * rootViewController =[[TDLTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    UINavigationController * navController = [[UINavigationController alloc]initWithRootViewController:rootViewController];
    
    self.window.rootViewController = navController;
                                              
    self.window.backgroundColor = [UIColor colorWithRed:255/255.0f green:144/255.0f blue:52/255.0f alpha:1.0f];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
