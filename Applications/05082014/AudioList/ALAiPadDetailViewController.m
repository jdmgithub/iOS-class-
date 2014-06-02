//
//  ALADetailViewController.m
//  AudioList
//
//  Created by Jisha Obukwelu on 5/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "ALAiPadDetailViewController.h"
#import "ALAiPadTableViewController.h"
#import "ALAiPadTableViewCell.h"
#import "ALAData.h"

@interface ALAiPadDetailViewController ()

@end

@implementation ALAiPadDetailViewController
{
    UILabel * title;
    UIImageView * albumCover;
    UIButton * likes;
    UIButton * dislikes;
    UILabel * likesCount;
    UILabel * dislikesCount;
    UILabel * timesPlayed;
    int likesUpdate;
    int dislikesUpdate;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.view.backgroundColor = [UIColor greenColor];
        
        title = [[UILabel alloc]initWithFrame:CGRectMake(175, 100, 125, 20)];
        title.textColor = [UIColor redColor];
        [self.view addSubview:title];
        
        albumCover = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
        albumCover.backgroundColor = [UIColor grayColor];
        [self.view addSubview:albumCover];
        
        likes = [[UIButton alloc] initWithFrame:CGRectMake(175, 140, 50, 50)];
        [likes setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
        [likes addTarget:self action:@selector(updateLikes:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:likes];
        
        dislikes = [[UIButton alloc] initWithFrame:CGRectMake(250, 140, 50, 50)];
        [dislikes setImage:[UIImage imageNamed:@"dislike"]forState:UIControlStateNormal];
        [dislikes addTarget:self action:@selector(updateDisLikes:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:dislikes];
        
        likesCount = [[UILabel alloc] initWithFrame:CGRectMake(175, 200, 50, 50)];
        likesCount.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:likesCount];
        
        dislikesCount = [[UILabel alloc] initWithFrame:CGRectMake(250, 200, 50, 50)];
        dislikesCount.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:dislikesCount];
        
        timesPlayed = [[UILabel alloc] initWithFrame:CGRectMake(220, 180, 100, 100)];
        [self.view addSubview:timesPlayed];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)setIndex:(NSInteger)index
{
    _index = index;
    NSDictionary * albumInfo = [[ALAData mainData] allTracks][index];
    
    title.text = albumInfo [@"title"];
    albumCover.image = albumInfo[@"image"];
    likesCount.text = albumInfo[@"likes"];
    dislikesCount.text = albumInfo[@"dislikes"];
    timesPlayed.text = albumInfo[@"timesPlayed"];
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
