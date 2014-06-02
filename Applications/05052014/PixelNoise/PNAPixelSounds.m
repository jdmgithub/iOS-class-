//
//  PNAPixelSounds.m
//  PixelNoise
//
//  Created by Jisha Obukwelu on 5/5/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "PNAPixelSounds.h"

@interface PNAPixelSounds ()

@end

@implementation PNAPixelSounds

- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

- (void)playSoundWithName:(NSString *)soundName
{
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    NSData * fileData = [NSData dataWithContentsOfFile:file];
    self.player = [[AVAudioPlayer alloc] initWithData:fileData error:nil];
    
    self.player.numberOfLoops = 0;
    [self.player play];
}





@end
