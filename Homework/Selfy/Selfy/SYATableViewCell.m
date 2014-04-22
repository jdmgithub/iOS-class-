//
//  SYATableViewCell.m
//  Selfy
//
//  Created by Jisha Obukwelu on 4/21/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "SYATableViewCell.h"

@implementation SYATableViewCell
{
    UIImageView * profileImage;
    UILabel * profileName;
    UILabel * profileCaption;
    UIImageView * profileAvatar;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, 280, 200)];
        profileImage.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:profileImage];
        
        profileName = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 280, 20)];
        profileName.backgroundColor = [UIColor darkGrayColor];
        profileName.textColor = [UIColor whiteColor];
        [self.contentView addSubview:profileName];
        
        profileCaption = [[UILabel alloc] initWithFrame:CGRectMake(100, 240, 200, 20)];
        profileCaption.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:profileCaption];
        
        profileAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(20, 240, 60, 60)];
        profileAvatar.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:profileAvatar];
    }
    return self;
}

- (void)setSelfyInfo: (NSDictionary *)selfyInfo
{
    _selfyInfo = selfyInfo;
    
    profileName.text = selfyInfo[@"name"];
    
    profileCaption.text = selfyInfo[@"caption"];
    
    NSURL * imageURL = [NSURL URLWithString:selfyInfo[@"image"]];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    
    profileImage.image = image;
    
    NSURL * avatarURL = [NSURL URLWithString:selfyInfo[@"avatar"]];
    NSData * avatarData = [NSData dataWithContentsOfURL:avatarURL];
    UIImage * avatar = [UIImage imageWithData:avatarData];
    
    profileAvatar.image = avatar;
    
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
