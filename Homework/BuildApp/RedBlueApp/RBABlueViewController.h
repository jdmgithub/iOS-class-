//
//  RBAThreeViewController.h
//  RedBlueApp
//
//  Created by Jisha Obukwelu on 5/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RBABlueDelegate;

@interface RBABlueViewController : UIViewController

@property (nonatomic,assign)id<RBABlueDelegate> delegate;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end

@protocol RBABlueDelegate <NSObject>

- (void)addPoints;




@end
