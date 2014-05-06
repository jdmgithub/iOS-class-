//
//  DNASingleton.h
//  DataNowApp
//
//  Created by Jisha Obukwelu on 5/6/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DNASingleton : NSObject

+ (DNASingleton *)sharedSingleton;

@property (nonatomic) NSDictionary * sectionInfo;

- (NSArray *) allRowsforSection:(NSString *)sectionName;

- (NSArray *) allSections;

@end
