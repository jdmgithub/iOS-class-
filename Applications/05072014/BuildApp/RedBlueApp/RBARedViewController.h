//
//  RBATwoViewController.h
//  RedBlueApp
//
//  Created by Jisha Obukwelu on 5/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RBARedDelegate;

@interface RBARedViewController : UIViewController

@property (nonatomic,assign)id<RBARedDelegate> delegate;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end

@protocol RBARedDelegate <NSObject>

- (void)addPoints;

@end
