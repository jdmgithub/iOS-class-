//
//  SCGCircle.m
//  Squares
//
//  Created by Jisha Obukwelu on 4/11/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "SCGCircle.h"

@implementation SCGCircle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
 {
     CGContextRef context = UIGraphicsGetCurrentContext();
     
     [[UIColor lightGrayColor] set];
     
     float dotXY = (self.frame.size.width - 20) / 2;
     
     CGContextAddEllipseInRect(context, CGRectMake(dotXY, dotXY, 20, 20));
     
     CGContextFillPath(context);
 }

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"my position is %d", self.position);
}


@end


