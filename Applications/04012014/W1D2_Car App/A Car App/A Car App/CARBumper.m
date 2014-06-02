//
//  CARBumper.m
//  A Car App
//
//  Created by Jisha Obukwelu on 4/1/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "CARBumper.h"

@implementation CARBumper

- (id)init
{
    self = [super init];
    if (self) {
        
        self.fixed = YES;
        self.backgroundColor = [UIColor blackColor];
        self.width = 1;
        self.brand = @"Porsche";
    }
    return self;
}



@end