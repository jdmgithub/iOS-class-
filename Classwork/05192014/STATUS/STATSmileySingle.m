//
//  STATSmileySIngleton.m
//  STATUS
//
//  Created by Jisha Obukwelu on 5/19/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "STATSmileySingle.h"

@implementation STATSmileySingle

+ (STATSmileySingle *) singleton
{
    static dispatch_once_t create;
    static STATSmileySingle  * singleton = nil;
    dispatch_once(&create, ^{
        singleton = [[STATSmileySingle alloc] init];
    }) ;
    return singleton;
}

@end
