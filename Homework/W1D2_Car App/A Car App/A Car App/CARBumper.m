//
//  CARBumper.m
//  A Car App
//
//  Created by Jisha Obukwelu on 4/1/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "CARBumper.h"

@implementation CARBumper

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.fixed = YES;
        self.bumperColor = [UIColor redColor];
    }
    return self;
}



@end
