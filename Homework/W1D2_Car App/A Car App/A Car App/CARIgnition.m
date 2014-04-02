//
//  CARIgnition.m
//  A Car App
//
//  Created by Jisha Obukwelu on 4/1/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "CARIgnition.h"

@implementation CARIgnition

- (id)init
{
    self = [super init];
    if(self)
    {
     self.backgroundColor = [UIColor greenColor];
     self.layer.cornerRadius = 20;     
    }
    return self;
    
}


@end
