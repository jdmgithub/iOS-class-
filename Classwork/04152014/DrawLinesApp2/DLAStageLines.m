//
//  DLAStage.m
//  DrawLinesApp
//
//  Created by Jisha Obukwelu on 4/15/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "DLAStageLines.h"

@implementation DLAStageLines
{
    NSMutableArray * lines;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        lines = [@[] mutableCopy];
    }
    
//    self.backgroundColor = [UIColor whiteColor];
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextClearRect(context, rect);
    
    [[UIColor purpleColor] set];
    
    CGContextSetLineWidth (context, 3.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    for(NSArray * line in lines)
    {
        CGPoint start = [line[0] CGPointValue];
        CGPoint end = [line[1] CGPointValue];
        
        CGContextMoveToPoint(context, start.x, start.y);
        CGContextAddLineToPoint(context,end.x, end.y);
        
        CGContextStrokePath(context);
    }
    
//    CGContextMoveToPoint(context, <#CGFloat x#>, <#CGFloat y#>);
//    
//    CGContextAddLineToPoint(context, <#CGFloat x#>, <#CGFloat y#>)
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//logs when you press down
{
    for (UITouch * touch in touches) {
        CGPoint location = [touch locationInView: self];
        
//        UIBezierPath * path = [[UIBezierPath alloc] init];
        
        [lines addObject:[@[
                            [NSValue valueWithCGPoint:location],
                            [NSValue valueWithCGPoint:location],
                            ] mutableCopy]];
                            
        
        NSLog(@"Touch X: %f Y: %f", location.x, location.y);
        
        [self setNeedsDisplay];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches) {
        CGPoint location = [touch locationInView: self];
        
        [lines lastObject][1] =[NSValue valueWithCGPoint:location];
        
        NSLog(@"Touch X: %f Y: %f", location.x, location.y);
        
        [self setNeedsDisplay];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches) {
        CGPoint location = [touch locationInView: self];
        
        [lines lastObject][1] =[NSValue valueWithCGPoint:location];

        
        NSLog(@"Touch X: %f Y: %f", location.x, location.y);
        
        [self setNeedsDisplay];
    }
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
