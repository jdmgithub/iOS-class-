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
//NS Dictionary is an object and it is pointing to access a value - pointer to access a value for NSDictionary
// getUserWithUsername is a method

@end
