//
//  ALAUser.h
//  AudioList
//
//  Created by Jisha Obukwelu on 5/12/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "ALADictionary.h"
@class ALAPlaylist;

@interface ALAUser : ALADictionary

//newUserWithUserName class method that takes in username parameter
//if we find an existing user will pass back otherwise allocate and init a new one

+ (id)newUser;

@end

