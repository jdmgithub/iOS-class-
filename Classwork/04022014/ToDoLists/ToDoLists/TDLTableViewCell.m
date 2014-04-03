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

//@synthesize profileInfo=_profileInfo; not necessary if only overriding getter or setter

//creating local instance of property... _ is naming convention for setter and getter but not for a method.

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

// -(NSDictionary *)profile
// {
//    if(_profileInfo == nil)
//    {
//        _profileInfo = @{@"name":@"Default name", @"image":[UIImage imageNamed:@"default"]};
//    }
//    return _profileInfo;
// }
//// Getter Method_ Assessor


- (void)setProfileInfo: (NSDictionary *)profileInfo
 {
     
//     if(profileInfo !=nil)
     _profileInfo = profileInfo;
     
//   UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
     profileImage.image = profileInfo[@"image"];
     profileImage.layer.cornerRadius = 30;
     profileImage.layer.masksToBounds = YES;
//     self.imageView.image = profieInfo[@"image"];
     
     
//   UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(100, 20, 100, 60)];
     profileName.text = profileInfo[@"name"];
     profileName.backgroundColor = [UIColor lightGrayColor];
     profileName.font = [UIFont fontWithName:@"Times New Roman" size:(12)];
     
     
//   UITextView * urlView = [[UITextView alloc] initWithFrame:CGRectMake(100, 40, 200, 60)];
     profileURL.text = profileInfo[@"github"];
     profileURL.backgroundColor = [UIColor lightGrayColor];
     profileURL.font = [UIFont fontWithName:@"Times New Roman" size:(12)];

 }
//setter _ Assessor

- (void)awakeFromNib
{   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

//-(NSDictionary *)profile
// {
//    return _profile;
// }
//- (void)setProfile: (NSDictionary *)profile
// {
//   _profile = profile;
// }
// this is to create a default value but does not have to be done because it is occuring on Apple for you.  This is also a way to test what is getting and setting. Do not use self.profile because it will cause an infinite loop.  Properties only occur after colons.

@end


