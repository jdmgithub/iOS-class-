//
//  IOSArray.h
//  iOSHomework
//
//  Created by Jisha Obukwelu on 5/18/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IOSArray : NSObject

+ (IOSArray *)sharedSingleton;

@property (nonatomic) NSArray * colors;
@property (nonatomic) NSArray * numbers;
- (NSArray *)allColors;
- (NSArray *)allNumbers;


@end
