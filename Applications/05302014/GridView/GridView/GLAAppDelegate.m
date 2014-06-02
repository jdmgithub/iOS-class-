//
//  GLAAppDelegate.m
//  GridView
//
//  Created by Jisha Obukwelu on 5/30/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "GLAAppDelegate.h"
#import "GLACollectionVC.h"

@implementation GLAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor greenColor];
    
    self.window.rootViewController = [[GLACollectionVC alloc]initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    
    [self.window makeKeyAndVisible];
    return YES;
}
							
@end
