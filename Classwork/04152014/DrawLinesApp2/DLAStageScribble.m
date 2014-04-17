//
//  DLAStageScribble.m
//  DrawLinesApp
//
//  Created by Jisha Obukwelu on 4/15/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "DLAStageScribble.h"

@implementation DLAStageScribble
{
    NSMutableArray * scribbles;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        scribbles = [@[] mutableCopy];
        
        self.lineWidth = 2.0;
        self.lineColor = [UIColor colorWithWhite:0.3 alpha:1.0];
        self.backgroundColor = [UIColor blackColor];
       
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextClearRect(context, rect);
    
    [self.lineColor set];
    
    for(NSDictionary * scribble in scribbles)
    {
        CGContextSetLineWidth(context, [scribble[@"width"]floatValue]);
        [(UIColor *)scribble[@"color"]set];
        
        NSArray * points = scribble[@"points"];
        
        CGPoint start = [points[0] CGPointValue];

        CGContextMoveToPoint(context, start.x, start.y);
        
        for (NSValue * value in points)
        {
//           int index = [scribble indexOfObject:value];
            
            CGPoint point = [value CGPointValue];
            
//            if(index >0)  CGContextAddLineToPoint(context, point.x, point.y);

            CGContextAddLineToPoint(context, point.x, point.y);

        }
        
        CGContextStrokePath(context);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//NSValue valueWithCGPoint:location creates an object instance for location
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        
        [scribbles addObject:[@{
                                @"color" : self.lineColor,
                                @"width" :@(self.lineWidth),
                                @"points" : [@[[NSValue valueWithCGPoint:location]]mutableCopy]
                                } mutableCopy]];
    }

    
        [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
//        [[scribbles lastObject] addObject:[NSValue valueWithCGPoint:location]];
        
        [[scribbles lastObject][@"points"] addObject:[NSValue valueWithCGPoint:location]];
    }
    
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
//        [[scribbles lastObject] addObject:[NSValue valueWithCGPoint:location]];
        
         [[scribbles lastObject][@"points"] addObject:[NSValue valueWithCGPoint:location]];
    }
    
        [self setNeedsDisplay];
}

- (void)setLineWidth:(float)lineWidth
{
    _lineWidth = lineWidth;
    [self setNeedsDisplay];
}

- (void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    [self setNeedsDisplay];
}


@end
