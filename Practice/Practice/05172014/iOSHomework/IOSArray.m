//
//  IOSArray.m
//  iOSHomework
//
//  Created by Jisha Obukwelu on 5/18/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "IOSArray.h"

@implementation IOSArray


+ (IOSArray *)sharedSingleton
{
    static dispatch_once_t singletonBlock;
    static IOSArray * singleton = nil;
    
    dispatch_once(&singletonBlock, ^{
        singleton = [[IOSArray alloc] init];
    });
    
    return singleton;
}


- (NSArray *)colors
{
    
    return  @[@{@"name": @"MAGENTA", @"color": [UIColor magentaColor]},
               @{@"name": @"ORANGE", @"color": [UIColor orangeColor]},
               @{@"name": @"YELLOW", @"color": [UIColor yellowColor]}
               ];
}

- (NSArray *)numbers
{
    
    return @[@{@"name":@"One Thousand", @"image": [UIImage imageNamed:@"number1"]},
             @{@"name":@"Five Hundred Fifty", @"image": [UIImage imageNamed:@"number2"]},
             @{@"name":@"Two Ninety Five", @"image": [UIImage imageNamed:@"number3"]},
                 ];

}

- (NSArray *)allColors
{
    return [self.colors copy];
    //return [NSArray arrayWithArray:self.listItems];
}

- (NSArray *)allNumbers
{
    return [self.numbers copy];
    //return [NSArray arrayWithArray:self.listItems];
}
@end
