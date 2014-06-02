//
//  ALASong.h
//  AudioList
//
//  Created by Jisha Obukwelu on 5/9/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALADictionary.h"

@class ALAUser;
@class ALAPlaylist;

@interface ALATrack : ALADictionary

+ (id)newTrack;

@property (nonatomic) ALAUser * user;
@property (nonatomic) ALAPlaylist * playlist;

@end
