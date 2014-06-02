//
//  STATSmileySIngleton.h
//  STATUS
//
//  Created by Jisha Obukwelu on 5/19/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STATSmileySingle : NSObject

+(STATSmileySingle *)singleton;

@property (nonatomic) NSInteger colors;
@property (nonatomic) NSInteger bigSmiley;
@end
