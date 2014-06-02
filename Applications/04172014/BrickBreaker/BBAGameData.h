//
//  BBAGameData.h
//  BrickBreaker
//
//  Created by Jisha Obukwelu on 5/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBAGameData : NSData

+ (BBAGameData *)mainData;

@property (nonatomic, readonly)NSInteger topScore;
@property (nonatomic) NSInteger currentScore;

- (NSArray *)gameScores;


@end
