//
//  LPAPlayPauseButton.h
//  LilPlayA
//
//  Created by Jisha Obukwelu on 5/13/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPAPlayPauseButton : UIButton

@property (nonatomic, getter = isToggled) BOOL toggled;
@property (nonatomic) UIColor * toggledTintColor;

- (void)toggle;


@end
