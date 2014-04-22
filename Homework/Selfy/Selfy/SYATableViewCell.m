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
    UITextView * profileName;
    UITextView * profileCaption;
    UIImageView * profileAvatar;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
        [self.contentView addSubview:profileImage];
        
        profileName = [[UITextView alloc] initWithFrame:CGRectMake(100, 20, 200, 60)];
        [self.contentView addSubview:profileName];
        
        profileCaption = [[UITextView alloc] initWithFrame:CGRectMake(100, 40, 200, 60)];
        [self.contentView addSubview:profileCaption];
        
        profileAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, 60, 60)];
        [self.contentView addSubview:profileAvatar];
    }
    return self;
}

- (void)setUserInfo: (NSDictionary *)userInfo
{
    profileImage.image = userInfo[@"image"];
    profileImage.layer.cornerRadius = 30;
    profileImage.layer.masksToBounds = YES;
    
    profileName.text = userInfo[@"name"];
    profileName.backgroundColor = [UIColor clearColor];
    profileName.font = [UIFont fontWithName:@"Times New Roman" size:(12)];
    
    profileCaption.text = userInfo[@"caption"];
    profileCaption.backgroundColor = [UIColor clearColor];
    profileCaption.font = [UIFont fontWithName:@"Times New Roman" size:(12)];
    
    profileAvatar.image = userInfo[@"avatar"];
    profileAvatar.layer.cornerRadius = 30;
    profileAvatar.layer.masksToBounds = YES;
    
    _userInfo = userInfo;
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
