//
//  TLATableViewController.h
//  TweetLike
//
//  Created by Jisha Obukwelu on 4/23/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLATableViewController : UITableViewController

@property (nonatomic) NSMutableArray * tweetItems;
@property (nonatomic, getter = isTweetItemsEmpty) BOOL tweetItemsEmpty;
- (void)addTweetsInDictionary:(NSString *)tweet;

@end
