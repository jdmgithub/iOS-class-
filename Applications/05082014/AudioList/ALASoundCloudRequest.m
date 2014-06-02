//
//  ALASoundCloudRequest.m
//  AudioList
//
//  Created by Jisha Obukwelu on 5/9/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#define CLIENT_ID @"client_id=696e2f773f0cbc06bc86196d87d8605f"
#define USER_NAME @"jisha-obukwelu"
#define SC_API @"https://api.soundcloud.com"

#import "ALASoundCloudRequest.h"
#import "ALAData.h"


@implementation ALASoundCloudRequest

+ (void)updateData
{
    NSURL * requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/users/%@/playlists.json?%@", SC_API,USER_NAME, CLIENT_ID]];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:requestURL];
    
    NSOperationQueue * queue  = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSArray * scInfo = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
     
    for (NSDictionary * playlistInfo in scInfo)
    {
        ALAPlaylist * playlist = [ALAPlaylist newPlaylist];
        
        playlist[@"title"] = playlistInfo[@"title"];
        
        [[ALAData mainData]addNewPlaylist:playlist];
        
        //create a new playlist and set things like playlst title
        
        for(NSDictionary  * trackInfo in playlistInfo[@"tracks"])
        {
            if(!trackInfo[@"streamable"]) continue;
            
            ALATrack * track = [ALATrack newTrack];
            
            track.playlist = playlist;
            
            track[@"title"] = trackInfo[@"title"];
            track[@"url"] = trackInfo[@"stream_url"];
            
            [playlist.tracks addObject:track];
            
            [[ALAData mainData] addNewTrack:track];
            
            ALAUser * user = [ALAUser newUser];
            
            user[@"username"] = trackInfo[@"user"][@"username"];
            
            track.user = user;
    }};
        
        NSNotificationCenter * nCenter = [NSNotificationCenter defaultCenter];
        [nCenter postNotificationName:@"dataUpdated" object:nil];
     }];

}


@end
