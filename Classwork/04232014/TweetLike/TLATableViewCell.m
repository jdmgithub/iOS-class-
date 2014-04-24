//
//  TLATableViewCell.m
//  TweetLike
//
//  Created by Jisha Obukwelu on 4/23/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TLATableViewCell.h"

@implementation TLATableViewCell
{
    UIImageView * heartImage;
    UILabel * tweetLike;
    UILabel * tweet;
    

}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        heartImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
        heartImage.image = [UIImage imageNamed:@"heart"];
        [self.contentView addSubview:heartImage];
        
        tweetLike = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 50, 20)];
        tweetLike.font = [UIFont fontWithName:@"HELVETICA" size:15];
        tweetLike.backgroundColor = [UIColor whiteColor];
        tweetLike.textColor = [UIColor redColor];
        [self.contentView addSubview:tweetLike];
        
        tweet = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 200, 60)];
        tweet.backgroundColor = [UIColor whiteColor];
        tweet.textColor = [UIColor blackColor];
        tweet.font = [UIFont fontWithName:@"HELVETICA" size:12];
        [self.contentView addSubview:tweet];
        tweet.numberOfLines = 0;
        tweet.lineBreakMode = NSLineBreakByWordWrapping;
        tweet.textAlignment = NSTextAlignmentJustified;
    }
    return self;
}

- (void)setTweetInfo:(NSDictionary *)tweetInfo
{
    _tweetInfo = tweetInfo;
    
    heartImage.image = tweetInfo[@"image"];
    tweetLike.text = [tweetInfo[@"likes"] stringValue];
    tweet.text = tweetInfo[@"tweet"];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
