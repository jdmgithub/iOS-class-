//
//  BBASingleton.m
//  BrickBreaker
//
//  Created by Jisha Obukwelu on 5/6/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "BBASingleton.h"

@implementation BBASingleton

+ (BBASingleton *)sharedSingleton
{
    static dispatch_once_t singletonBlock;
    static BBASingleton * singleton = nil;
    
    dispatch_once(&singletonBlock, ^{
        singleton = [[BBASingleton alloc] init];
    });
    return singleton;
}

- (NSArray *)allRowsforSection:(NSString *)sectionName
{
    return self.sectionInfo[sectionName];
}

-  (NSArray *)allSections
{
    return [self.sectionInfo allKeys];
}


@end
