//
//  MGAPreferenceArrays.h
//  MGASwipeView
//
//  Created by Jisha Obukwelu on 6/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGAPreferenceArrays : NSObject

+ (MGAPreferenceArrays *)sharedArrays;

@property (nonatomic) NSMutableArray *likes;
@property (nonatomic) NSMutableArray *dislikes;
@property (nonatomic) NSMutableArray *viewLater;

- (void)addLikes : (NSMutableArray *)likes;
- (void)addDislikes : (NSMutableArray*)dislikes;
- (void)viewLater : (NSMutableArray *)later;


@end
