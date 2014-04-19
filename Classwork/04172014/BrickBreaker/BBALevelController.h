//
//  BBALevelController.h
//  BrickBreaker
//
//  Created by Jisha Obukwelu on 4/17/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BBALevelDelegate;

@interface BBALevelController : UIViewController

@property (nonatomic,assign)id<BBALevelDelegate> delegate;

- (void)resetLevel;

@end

@protocol BBALevelDelegate <NSObject>

@optional

- (void)addPoints:(int)points;
- (void)gameDone;
- (void)reduceLives:(int)lives;

@end