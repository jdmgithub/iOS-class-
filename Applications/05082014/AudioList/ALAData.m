//
//  ALASingleton.m
//  AudioList
//
//  Created by Jisha Obukwelu on 5/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "ALAData.h"
#import "ALASoundCloudRequest.h"


@interface ALAData ()

@end

@implementation ALAData
{
    NSMutableArray * tracks;
    NSMutableArray * users;
    NSMutableArray * playlists;
    NSMutableArray * albumLists;
}

+ (ALAData *)mainData;
{
    static dispatch_once_t create;
    static ALAData * singleton;
    
    dispatch_once(&create, ^{
        singleton = [[ALAData alloc] init];
    });
    return singleton;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        tracks = [@[]mutableCopy];
        users = [@[]mutableCopy];
        playlists = [@[]mutableCopy];
    }
    return self;
}

- (void)addNewTrack:(ALATrack *)track
{ [tracks addObject:track]; }

- (NSArray *)allTracks
{ return [tracks copy];}

- (void)addNewUser:(ALAUser *)user
{ [users addObject:user]; }

- (NSArray *)allUsers
{ return [users copy]; }

- (void)addNewPlaylist:(ALAPlaylist *)playlist
{ [playlists addObject:playlist]; }

- (NSArray *)allPlaylists
{ return [playlists copy]; }


@end
