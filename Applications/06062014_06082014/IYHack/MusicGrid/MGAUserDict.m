//
//  MGAUserDict.m
//  MusicGrid
//
//  Created by Jisha Obukwelu on 6/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "MGAUserDict.h"

@implementation MGAUserDict

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary
{
    if(self = [self init]) {
    // Assign all properties with keyed values from the dictionary
        _first_name = [jsonDictionary objectForKey:@"first_name"];
        _last_name = [jsonDictionary objectForKey:@"last_name"];
        _username = [jsonDictionary objectForKey:@"username"];
        _password = [jsonDictionary objectForKey:@"password"];
    }
    return self;
}

@end
