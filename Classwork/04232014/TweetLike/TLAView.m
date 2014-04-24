//
//  TLAView.m
//  TweetLike
//
//  Created by Jisha Obukwelu on 4/23/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TLAView.h"

@implementation TLAView
{
    UIView * newTweetLayout;
    UIImageView * logo;
    UIButton * submitTweetButton;
    UIButton * cancelTweetButton;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        newTweetLayout = [[UIView alloc] initWithFrame:CGRectMake(0, 40, 280, 360)];
        newTweetLayout.backgroundColor = [UIColor blueColor];
        [self addSubview:newTweetLayout];
       
        logo = [[UIImageView alloc] initWithFrame:CGRectMake((320 - 200)/2, 0, 200, 100)];
        logo.image = [UIImage imageNamed:@"logo"];
        [newTweetLayout addSubview:logo];
        
        
        
        submitTweetButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 290, 80, 40)];
        submitTweetButton.backgroundColor = [UIColor greenColor];
        submitTweetButton.layer.cornerRadius = 10;
        [newTweetLayout addSubview:submitTweetButton];
        [submitTweetButton setTitle:@"SUBMIT" forState:UIControlStateNormal];
        submitTweetButton.titleLabel.textColor = [UIColor whiteColor];
        [submitTweetButton addTarget:(self) action:@selector (submitTweet:) forControlEvents:UIControlEventTouchUpInside];
        
        cancelTweetButton = [[UIButton alloc] initWithFrame:CGRectMake(170, 290, 80, 40)];
        cancelTweetButton.backgroundColor = [UIColor redColor];
        cancelTweetButton.layer.cornerRadius = 10;
        [newTweetLayout addSubview:cancelTweetButton];
        [cancelTweetButton setTitle:@"SUBMIT" forState:UIControlStateNormal];
        cancelTweetButton.titleLabel.textColor = [UIColor whiteColor];
        [cancelTweetButton addTarget:(self) action:@selector (submitTweet:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)submitTweet:(UIButton * )sender
{
    
}

- (void)canceTweet:(UIButton * )sender
{
    
}


@end
