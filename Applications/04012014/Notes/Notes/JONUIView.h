//
//  JONUIView.h
//  Notes
//
//  Created by Jisha Obukwelu on 4/1/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JONUIView : UIView

@property (nonatomic) NSString * coolTitle;

+ (NSNumber *)randomNumber;

+ (NSString *)whatIsMyTitle;

- (void)changeTitleWithName:(NSString *)name andSomething: (NSString *)something;

@end
