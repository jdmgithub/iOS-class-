//
//  DNAAppDelegate.m
//  DataNowApp
//
//  Created by Jisha Obukwelu on 5/6/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "DNAAppDelegate.h"
#import "DNATableViewController.h"
#import "DNASingleton.h"

@implementation DNAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
//    [DNASingleton sharedSingleton].sectionInfo = @{
//                                                   @"section1":@[@"row1"],
//                                                   @"section2":@[@"row1", @"row 2"],
//                                                   @"section3":@[@"row1", @"row 2",  @"row 3"],
//                                                   @"section4":@[@"row1"]
//                                                   };
    
                                                   
    self.window.rootViewController = [[DNATableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
