//
//  ALAAlbums.h
//  AudioList
//
//  Created by Jisha Obukwelu on 5/9/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ALAArtist;


@interface ALAAlbums : NSDictionary

@property (nonatomic) ALAArtist * artist;
@property (nonatomic) NSArray * albums;

@end
