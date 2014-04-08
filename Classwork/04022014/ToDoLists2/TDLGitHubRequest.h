//
//  TDLGitHubRequest.h
//  ToDoLists
//
//  Created by Jisha Obukwelu on 4/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDLGitHubRequest : NSObject
+ (NSDictionary *)getUserWithUsername:(NSString *)username;

@end
