//
//  ALAPlaylist.h
//  AudioList
//
//  Created by Jisha Obukwelu on 5/12/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "ALADictionary.h"

@class ALAUser;
@class ALATrack;

@interface ALAPlaylist : ALADictionary

+ (id)newPlaylist;

@property (nonatomic) NSMutableArray * tracks;


@end
