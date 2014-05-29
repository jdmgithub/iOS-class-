//
//  BitDataArchitecture.m
//  STATUS
//
//  Created by Jisha Obukwelu on 5/29/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "BITDataArchitecture.h"

@implementation BITDataArchitecture
{
    NSArray * colors;
    NSMutableDictionary * colorDictionary;
    NSDictionary * faces;
    
    int chosenColorIndex; //will be the index of the chosen color
    int chosenFaceIndex; //will be the index of the chosen face
}

- (NSDictionary *)returnChosenFace
{
    return colors[chosenColorIndex][@"faces"][chosenFaceIndex];
   //    or you can do two for loops
}

- (void)setUpArchitecture
{
//
//                  This is your main colors array
//                  |
//                  |   this is the 1st dictionary in the array
//                  |   |
//                  |   |   this is the array of faces for your 1st dictionary
//                  |   |   |
//                  |   |   |   this is the first item in your faces array
//                  |   |   |   |
//                  |   |   |   |

//    
    
    colorDictionary = [@{
               @"yellow": @"image1",
               @"red" : @"image2",
               } mutableCopy];
    
    
    faces = @{
              @"yellow": @[@"face1", @"face1"],
              @"red" : @[@"face1", @"face1"],
              };
    
    colors = @[
               @{
                   @"color" : @"yellow",
                   @"image" : @"colors0",
                   @"faces" : @[
                                @{
                                    @"emotion" : @"happy",
                                    @"image" : @"yellow 0",
                                    },
                                @{
                                    @"emotion" : @"smirk",
                                    @"image" : @"yellow 1",
                                    },
                                ]
                   },
               @{
                   @"color" : @"red",
                   @"image" : @"colors1",
                   
                   },
               @{
                   @"color" : @"blue",
                   @"image" : @"colors2",
                   
                   },
               @{
                   @"color" : @"orange",
                   @"image" : @"colors3",
                   
                   },
               @{},
               @{},
               @{},
               @{},
               @{},
               ];

    colorDictionary = [@{
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
                        } mutableCopy];
}

- (void)addFace: (NSDictionary *)face withColor:(int)colorIndex
{
    [colors[colorIndex][@"faces"] addObject:face];
}

- (void)createColors
{
    NSString * yellowKey = [colorDictionary allKeys][0];
    NSDictionary * yellowColor = colorDictionary[yellowKey];
    
    
    for (NSString * key in [colorDictionary allKeys])
    {
        NSDictionary * color = colorDictionary [key];
        
        NSLog(@"%@", color);
        
        [self createFacesWithColor:key];
    }
    
    for (NSDictionary * color in colors)
    {
        NSString * imageFileName = color[@"image"];
        
        [self createFacesWithColorDictionary:color];
    }
}

- (void)createFacesWithColor: (NSString *)color
{
    NSArray * faces = colorDictionary[color][@"faces"];
    for (NSDictionary * face in faces) {
        NSLog (@"%@", face);
    }
}

- (void)createFacesWithColorDictionary: (NSDictionary *)color
{
    NSArray * faces = color[@"faces"];
    for (NSDictionary * face in faces) {
        NSLog (@"%@", face);
    }
}


@end
