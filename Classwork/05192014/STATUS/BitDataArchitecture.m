//
//  BitDataArchitecture.m
//  STATUS
//
//  Created by Jisha Obukwelu on 5/29/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "BitDataArchitecture.h"

@implementation BitDataArchitecture
{
    NSArray * colors;
    NSMutableDictionary * colorDictionary;
}

- (void)setUpArchitecture
{
//    colors = @[
//               @{
//                   @"color" : @"yellow",
//                   @"image" : @"colors0",
//                   @"faces" : @[
//                                @{
//                                    @"emotion" : @"happy",
//                                    @"image" : @"yellow 0",
//                                    },
//                                @{
//                                    @"emotion" : @"smirk",
//                                    @"image" : @"yellow 1",
//                                    },
//                                ]
//                   },
//               @{
//                   @"color" : @"red",
//                   @"image" : @"colors1",
//                   
//                   },
//               @{
//                   @"color" : @"blue",
//                   @"image" : @"colors2",
//                   
//                   },
//               @{
//                   @"color" : @"orange",
//                   @"image" : @"colors3",
//                   
//                   },
//               @{},
//               @{},
//               @{},
//               @{},
//               @{},
//               ];
    
    colorDictionary = @{
                        @"yellow" : @{
                                @"image" : @"colors0",
                                @"faces"  : [@[
                                               @{
                                                   @"emotion" : @"happy",
                                                   @"image" : @"yellow0",
                                                   },
                                               @{
                                                   @"emotion" : @"smirl",
                                                   @"image" : @"yellow1",
                                                   },
                                               ] mutableCopy],
                                                },
                        @"red" : @{
                                    @"image" : @"colors1",
                                    @"faces" : [@[] mutableCopy],
                                    },
                        };
}

- (void)createColors
{
//    for (NSDictionary * color in colors) {
//        NSString * imageFileName = color[@"image"];
//        imageFileName = [color objectForKey:@"image"];
//         UIImage * colorImage = [UIImage imageNamed:imageFileName];
    
// literal
// UIImage * colorImage = [UIImage imageNamed:colors[@"image"]];
    
    NSString * yellowKey = [colorDictionary allKeys][0];
    NSDictionary * yellowColor = colorDictionary[yellowKey];
    
    for (NSString * key in [colorDictionary allKeys])
    {
        NSDictionary * color = colorDictionary [key];
    }
    
    for (NSDictionary * color in colors)
    {
        NSString * imageFileName = color[@"image"];
        imageFileName = [color objectForKey:@"image"];
        UIImage * colorImage = [UIImage imageNamed:imageFileName];
    }
}

- (void)createFacesWithColor: (NSDictionary *)color
{
    
}

@end
