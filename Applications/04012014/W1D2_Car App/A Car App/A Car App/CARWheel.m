//
//  CARWheel.m
//  A Car App
//
//  Created by Jisha Obukwelu on 4/1/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "CARWheel.h"

@implementation CARWheel

- (id)init
{
    self = [super init];
    if(self)
    {
        self.tirePressure = 30;
        self.flat = NO;
        
        self.backgroundColor = [UIColor blueColor];
        self.layer.cornerRadius = 30;
        self.rimSize = 20;
        self.brand = @"Mitchelin";
        
    }
    return self;
}
-(void)fillWithAir
    {
        self.tirePressure =30;
        self.flat = NO;
    }



@end
