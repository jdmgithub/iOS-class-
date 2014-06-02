//
//  ALASingleton.h
//  AudioList
//
//  Created by Jisha Obukwelu on 5/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALATrack.h"
#import "ALAUser.h"
#import "ALAPlaylist.h"

@interface ALAData : NSObject

+ (ALAData *)mainData;

- (NSArray *)allTracks;
- (void)addNewTrack:(ALATrack *)track;

- (NSArray *)allUsers;
- (void)addNewUser:(ALAUser *)users;

- (NSArray *)allPlaylists;
- (void)addNewPlaylist:(ALAPlaylist *)playlists;


@property (nonatomic) NSInteger likesUpdate;

@property (nonatomic) NSInteger dislikesUpdate;

@end
