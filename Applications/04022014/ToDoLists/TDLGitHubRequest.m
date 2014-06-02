//
//  TDLGitHubRequest.m
//  ToDoLists
//
//  Created by Jisha Obukwelu on 4/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLGitHubRequest.h"

@implementation TDLGitHubRequest

+ (NSDictionary *)getUserWithUsername:(NSString *)username
{
    NSMutableDictionary * userInfo = [@{} mutableCopy];
    
    NSString * github =[NSString stringWithFormat:@""@"https://api.github.com/users/%@", username];
    
    NSURL * url = [NSURL URLWithString:github];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
//    NSOperationQueue * queue =[[NSOperationQueue alloc]init];
    
    //    [NSURLConnection sendAsynchronousRequest:request queue:(NSOperationQueue *) completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
    //
    //        if (connectionError ==nil)
    //        {
    //
    //        } else {
    //            NSLog(!"%@", connectionError);
    //        }
    //        }]
    
    NSURLResponse * response = nil;
    NSError * error = nil;
    
    
     NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse: &response error:&error];
//NSData just looks at a page - does not recognize JSON or individual components.
//setting value of data
    
    NSError * jsonError = nil;
    
    NSDictionary * githubProfile = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
// parses value
    
    //    for (NSString * key in [githubProfile allKeys]) {
    //        statements
    //    }
    
    
    
    NSLog(@"%@", githubProfile);
    
    if (githubProfile[@"name"] != nil) userInfo[@"name"] = githubProfile[@"name"];
    if (githubProfile[@"avatar_url"] != nil) userInfo[@"image"] = githubProfile[@"avatar_url"];
    if (githubProfile[@"html_url"] != nil) userInfo[@"github"] = githubProfile[@"html_url"];

    
//    if (githubProfile[@"name"] != nil) [userInfo setObject:githubProfile[@"name"] forKey:@"name"];
//    if (githubProfile[@"avatar_url"] != nil) [userInfo setObject:githubProfile[@"avatar_url"] forKey:@"image"];
//    if (githubProfile[@"html_url"] != nil) [userInfo setObject:githubProfile[@"html_url"] forKey:@"github"];
//    
    
    
    //    userInfo = @{@"name" : githubProfile[@"name"],
    //                 @"image" : githubProfile[@"avatar_url"],
    //                 @"github" : githubProfile[@"html_url"]};
    
    return userInfo;
}

@end
