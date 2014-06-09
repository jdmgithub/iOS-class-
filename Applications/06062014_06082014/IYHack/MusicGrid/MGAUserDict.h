//
//  MGAUserDict.h
//  MusicGrid
//
//  Created by Jisha Obukwelu on 6/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGAUserDict : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString * first_name;
@property (readonly) NSString * last_name;
@property (readonly) NSString * username;
@property (readonly) NSString * password;
@property (readonly) NSString * email;

@end
