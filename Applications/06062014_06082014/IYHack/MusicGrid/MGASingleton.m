//
//  MGASingleton.m
//  MusicGrid
//
//  Created by Austin Nolan on 6/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "MGASingleton.h"


@interface MGASingleton ()

@end


@implementation MGASingleton
{
    
    
    NSString * userAvatarString;
    NSString * name;
    
    
    
}





+(MGASingleton *)sharedData
{
    
    static dispatch_once_t create;
    static MGASingleton * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[MGASingleton alloc]init];
        
    });
    return singleton;
}

-(id)init
{
    
    self = [super init];
    
    if (self)
    {
        self.avString = userAvatarString;
        
        self.userName = name;
        
        
        
    }
    
    return self;
}
@end