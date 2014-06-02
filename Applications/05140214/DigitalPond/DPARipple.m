//
//  DPARipple.m
//  DigitalPond
//
//  Created by Jisha Obukwelu on 5/14/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "DPARipple.h"

@implementation DPARipple

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)didMoveToWindow
{
    for (int i=0; i < self.rippleCount; i++)
    {
        float delayAmount = (self.rippleLifeTime / self.rippleCount) * i;
        
        [self rippleLinewithDelay:delayAmount];
    }
}

- (void)rippleLinewithDelay:(float)delay
{
    UIView * rippleLine = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
    
    rippleLine.backgroundColor = self.tintColor;
    
    rippleLine.layer.borderWidth = 1.0;
    rippleLine.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.3].CGColor;
    
    [self addSubview:rippleLine];
    
    [UIView animateWithDuration:self.rippleLifeTime delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        rippleLine.frame = CGRectMake(-40, -40, 80, 80);
        rippleLine.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        [rippleLine removeFromSuperview];
    }];
}



















/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
