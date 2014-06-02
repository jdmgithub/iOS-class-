//
//  JONUIView.m
//  Notes
//
//  Created by Jisha Obukwelu on 4/1/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "JONUIView.h"

@implementation JONUIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)didMoveToWindow
{
    NSLog(@"%@", self.coolTitle);
}

+ (NSNumber *)randomNumber
{
    NSNumber *num;

    num = @5;
    
    return num;
}

- (NSString *)whatIsMyTitle
{
    return self.coolTitle;
}

- (void)changeTitleWithName:(NSString *)name andSomething:(NSString *)something
{
    self.coolTitle = [NSString stringWithFormat:@"%@ %@", name, something];
    
}

@end
