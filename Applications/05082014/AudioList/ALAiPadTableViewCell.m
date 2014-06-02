//
//  ALAiPadTableViewCell.m
//  AudioList
//
//  Created by Jisha Obukwelu on 5/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "ALAiPadTableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import "ALAData.h"

@implementation ALAiPadTableViewCell
{
    UILabel * title;
    UIImageView * albumCover;
    AVAudioPlayer * music;
    UIButton * likes;
    UIButton * dislikes;
    UILabel * likesCount;
    UILabel * dislikesCount;
    UILabel * playbackCount;
    int likesUpdate;
    int dislikesUpdate;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        title = [[UILabel alloc]initWithFrame:CGRectMake(100, 5, 200, 20)];
        title.textColor = [UIColor redColor];
        [self.contentView addSubview:title];
        
        albumCover = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 90, 90)];
        albumCover.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:albumCover];
        
//        likes = [[UIButton alloc] initWithFrame:CGRectMake(100, 30, 30, 30)];
//        [likes setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
//        [likes addTarget:self action:@selector(updateLikes:) forControlEvents:UIControlEventTouchUpInside];
//        [self.contentView addSubview:likes];
//        
//        dislikes = [[UIButton alloc] initWithFrame:CGRectMake(150, 30, 30, 30)];
//        [dislikes setImage:[UIImage imageNamed:@"dislike"]forState:UIControlStateNormal];
//        [dislikes addTarget:self action:@selector(updateDisLikes:) forControlEvents:UIControlEventTouchUpInside];
//        [self.contentView addSubview:dislikes];
//        
//        likesCount = [[UILabel alloc] initWithFrame:CGRectMake(100, 65, 30, 30)];
//        likesCount.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:likesCount];
//        
//        dislikesCount = [[UILabel alloc] initWithFrame:CGRectMake(150, 65, 30, 30)];
//        dislikesCount.textAlignment = NSTextAlignmentCenter;
//        [self.contentView addSubview:dislikesCount];
        
        playbackCount = [[UILabel alloc] initWithFrame:CGRectMake(220, 30, 68, 68)];
        [self.contentView addSubview:playbackCount];        
    }
    return self;
}

- (void)setIndex:(NSInteger)index//:(NSInteger)index
{
    NSDictionary * albumInfo = [[ALAData mainData] allTracks] [index];
     title.text = albumInfo [@"title"];
    albumCover.image = albumInfo[@"image"];
    likesCount.text = albumInfo[@"likes"];
    dislikesCount.text = albumInfo[@"dislikes"];
    playbackCount.text = albumInfo[@"timesPlayed"];
}

- (void)updateLikes: (UIButton *)sender
{
    likesUpdate ++;
    [ALAData mainData].likesUpdate = likesUpdate;
    likesCount.text = [NSString stringWithFormat:@"%d", [ALAData mainData].likesUpdate];
}

- (void)updateDisLikes: (UIButton*)sender
{
    dislikesUpdate ++;
    [ALAData mainData].dislikesUpdate = dislikesUpdate;
    dislikesCount.text = [NSString stringWithFormat:@"%d",[ALAData mainData].dislikesUpdate];
}


@end
