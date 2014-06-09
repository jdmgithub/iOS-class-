//
//  MGASingleton.h
//  MusicGrid
//
//  Created by Austin Nolan on 6/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGASingleton : NSObject
+(MGASingleton *)sharedData;



@property (nonatomic) NSString * avString;
@property (nonatomic) NSString * userName;

@end
