//
//  CARWindow.m
//  A Car App
//
//  Created by Jisha Obukwelu on 4/1/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "CARWindow.h"

@implementation CARWindow

- (id)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor =[UIColor blackColor];
        self.tint = @"black";
        self.alpha =0.8;
        self.brand = @"Porsche";
        self.fixed = YES;
    }
    return self;
}



@end
