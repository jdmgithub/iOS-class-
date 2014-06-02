//
//  LPAPlayPauseButton.m
//  LilPlayA
//
//  Created by Jisha Obukwelu on 5/13/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "LPAPlayPauseButton.h"

@implementation LPAPlayPauseButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)toggle
{
    self.toggled = !self.toggled;
}

- (void)setToggled:(BOOL)toggled
{
    _toggled = toggled;
    self.alpha = 0.0;
    
    //redraws by callig drawRect:
    [self setNeedsDisplay];
    [UIView animateWithDuration:0.3 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.alpha = 1.0;
                     } completion:nil];
}

- (void)drawRect:(CGRect)rect
{
    float pad = 1.0;
    float w = rect.size.width - pad;
    float h = rect.size.height - pad;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    //    NSLog(@"%@", self.backgroundColor);
    
    CGContextClearRect(context, rect);
    
    [self.tintColor set];
    
    if ([self isToggled])
    {
        if(self.toggledTintColor !=nil) [self.toggledTintColor set];
        
        CGContextMoveToPoint(context, pad, pad);
        CGContextAddLineToPoint(context, w, h/2);
        
        CGContextMoveToPoint(context, w, pad);
        CGContextAddLineToPoint(context, pad, h/2);
        
        CGContextMoveToPoint(context, pad, pad);
        CGContextAddLineToPoint(context, pad, pad);
        
    } else {
        
        CGContextMoveToPoint(context, pad, pad);
        CGContextAddLineToPoint(context, w, pad);
        
        CGContextMoveToPoint(context, pad, h/2);
        CGContextAddLineToPoint(context, w, h/2);
    }
    
    CGContextStrokePath(context);
}

@end
