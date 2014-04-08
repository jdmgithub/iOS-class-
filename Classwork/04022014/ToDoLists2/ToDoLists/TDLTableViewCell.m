//
//  TDLTableViewCell.m
//  ToDoLists
//
//  Created by Jisha Obukwelu on 4/3/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLTableViewCell.h"

@implementation TDLTableViewCell
{
    UIImageView * profileImage;
    UITextView * profileName;
    UITextView * profileURL;
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
        
        profileURL = [[UITextView alloc] initWithFrame:CGRectMake(100, 40, 200, 60)];
        [self.contentView addSubview:profileURL];
        
    }
    return self;
}
- (void)setProfileInfo: (NSDictionary *)profileInfo
 {
     NSURL * imageURL = [NSURL URLWithString:profileInfo[@"image"]];
     
     NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
     
     //NSData * imageData = [NSData dataWithContentsOfURL:profileInfo[@"imag"]];
     
     UIImage * image = [UIImage imageWithData:imageData];
     
     profileImage.image = image;
  //   profileImage.image = profileInfo[@"image"];
     profileImage.layer.cornerRadius = 30;
     profileImage.layer.masksToBounds = YES;
     
     profileName.text = profileInfo[@"name"];
     profileName.backgroundColor = [UIColor clearColor];
     profileName.font = [UIFont fontWithName:@"Times New Roman" size:(12)];
     
     profileURL.text = profileInfo[@"github"];
     profileURL.backgroundColor = [UIColor clearColor];
     profileURL.font = [UIFont fontWithName:@"Times New Roman" size:(12)];

     _profileInfo = profileInfo;

 }


- (void)awakeFromNib
{   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}


@end


