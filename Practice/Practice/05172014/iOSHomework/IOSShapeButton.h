//
//  SLFSettingsButton.h
//  Selfy
//
//  Created by Jisha Obukwelu on 4/30/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IOSShapeButton : UIButton

@property (nonatomic, getter = isToggled) BOOL toggled;
@property (nonatomic) UIColor * toggledTintColor;

- (void)toggle;

@end
