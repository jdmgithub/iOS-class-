//
//  RBAPoints.h
//  RedBlueApp
//
//  Created by Jisha Obukwelu on 5/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBAPoints : NSObject

+ (RBAPoints *)mainData;

@property (nonatomic) NSInteger redScore;
@property (nonatomic) NSInteger blueScore;
@property (nonatomic) NSInteger totalScore;




@end
