//
//  SLFSettingsButton.m
//  Selfy
//
//  Created by Jisha Obukwelu on 4/30/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLAddNewUserButton.h"

@implementation TDLAddNewUserButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
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
    CGContextMoveToPoint(context, pad, pad);
    CGContextAddLineToPoint(context, w, pad);
    
    CGContextMoveToPoint(context, pad, h/2);
    CGContextAddLineToPoint(context, w, h/2);
    
    CGContextMoveToPoint(context,   pad, h);
    CGContextAddLineToPoint(context, w, h);
    
    
    CGContextStrokePath(context);
}


@end
