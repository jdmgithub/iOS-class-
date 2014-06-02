//
//  RBAPoints.m
//  RedBlueApp
//
//  Created by Jisha Obukwelu on 5/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "RBAPoints.h"

@implementation RBAPoints

+ (RBAPoints *)mainData
{
    static dispatch_once_t create;
    static RBAPoints * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[RBAPoints alloc]init];
    });
    return singleton;
}

- (void)setTotalScore:(NSInteger)totalScore
{
    _totalScore = _redScore + _blueScore;
}

@end
