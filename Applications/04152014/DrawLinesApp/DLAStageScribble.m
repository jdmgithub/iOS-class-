//
//  DLAStageScribble.m
//  DrawLinesApp
//
//  Created by Jisha Obukwelu on 4/15/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "DLAStageScribble.h"

@implementation DLAStageScribble

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.lines = [@[] mutableCopy];
        
        self.backgroundColor = [UIColor blackColor];
       
    }
    return self;
}

-(void)clearStage
{
    [self.lines removeAllObjects];
    [self setNeedsDisplay];
}

-(void)undoStage
{
    [self.lines removeLastObject];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapRound);
//    CGContextSetLineJoin(context, kCGLineJoinRound);
//    
//    CGContextMoveToPoint(context, 50, 50);
//    CGContextAddCurveToPoint(context, 270, 50, 270, 400, 50, 400);
    
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextClearRect(context, rect);
    
    [self.lineColor set];
    
    for(NSDictionary * line in self.lines)
    {
        CGContextSetLineWidth(context, [line[@"width"]floatValue]);
        [(UIColor *)line[@"color"]set];
        
        NSArray * points = line[@"points"];
        CGPoint start = [points[0] CGPointValue];
        CGContextMoveToPoint(context, start.x, start.y);        
        for (NSValue * value in points)
        {
            CGPoint point = [value CGPointValue];
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
        
        
        [self.lines addObject:[@{
                                @"color" : self.lineColor,
                                @"width" :@(self.lineWidth),
                                @"points" : [@[[NSValue valueWithCGPoint:location]]mutableCopy]
                                } mutableCopy]];
    }
    
        [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouch:touches];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self doTouch:touches];
}

- (void)doTouch:(NSSet *)touches
{
    UITouch * touch = [touches allObjects][0];
    
    CGPoint location = [touch locationInView: self];
    
    [[self.lines lastObject][@"points"] addObject:[NSValue valueWithCGPoint:location]];
    
    [self setNeedsDisplay];
    
}




@end
