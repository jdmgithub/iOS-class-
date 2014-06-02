//
//  DNASingleton.m
//  DataNowApp
//
//  Created by Jisha Obukwelu on 5/6/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "DNASingleton.h"

@implementation DNASingleton

+ (DNASingleton *)sharedSingleton
{
    static dispatch_once_t singletonBlock;
    static DNASingleton * singleton = nil;
    
    dispatch_once(&singletonBlock, ^{
        singleton = [[DNASingleton alloc] init];
    });
    
    return singleton;
}

- (NSArray *)allRowsforSection:(NSString *)sectionName
{
    return self.sectionInfo[sectionName];
}


- (NSDictionary *)sectioninfo
{
    return @{
             @"section1": @[@"row 1", @"row 2"],
             @"section 2": @[@"row 1", @"row 2", @"row 3"],
             };
}

-  (NSArray *)allSections
{
    return [self.sectionInfo allKeys];
}


@end


