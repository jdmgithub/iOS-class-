//
//  BBASingleton.h
//  BrickBreaker
//
//  Created by Jisha Obukwelu on 5/6/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBASingleton : NSObject

+ (BBASingleton *)sharedSingleton;

@property (nonatomic)NSDictionary * sectionInfo;

- (NSArray *)allRowsforSection:(NSString *)sectionNames;
- (NSArray *)allSections;

@end
