//
//  MGAPreferenceArrays.m
//  MGASwipeView
//
//  Created by Jisha Obukwelu on 6/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "MGAPreferenceArrays.h"

@implementation MGAPreferenceArrays

+ (MGAPreferenceArrays *)sharedArrays
{
    static dispatch_once_t create;
    static MGAPreferenceArrays * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[MGAPreferenceArrays alloc] init];
    });
    return singleton;
}

- (NSArray *)allLikes
{
    return [self.likes copy];
}

- (NSArray *)allDislikes
{
    return [self.dislikes copy];
}

-  (NSArray *)allViewLater
{
    return [self.viewLater copy];
}

- (void)addLikes : (NSMutableArray *)likes;
{
    
}

- (void)addDislikes : (NSMutableArray*)dislikes
{
    
}

- (void)viewLater : (NSMutableArray *)later
{
    
}

@end
