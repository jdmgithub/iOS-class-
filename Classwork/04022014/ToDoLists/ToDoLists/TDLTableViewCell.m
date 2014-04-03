//
//  TDLTableViewCell.m
//  ToDoLists
//
//  Created by Jisha Obukwelu on 4/3/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLTableViewCell.h"

@implementation TDLTableViewCell

//@synthesize profileInfo=_profileInfo; not necessary if only overriding getter or setter

//creating local instance of property... _ is naming convention for setter and getter but not for a method.

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
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
     UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
     
     imageView.image = profileInfo[@"image"];
     imageView.layer.cornerRadius = 30;
     imageView.layer.masksToBounds = YES;
//     self.imageView.image = profieInfo[@"image"];
     [self.contentView addSubview:imageView];
//     if(profileInfo !=nil)
      _profileInfo = profileInfo;
     
     UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(100, 20, 100, 60)];
     textView.text = profileInfo[@"name"];
     [self.contentView addSubview:textView];
     textView.backgroundColor = [UIColor lightGrayColor];
     textView.font = [UIFont fontWithName:@"Times New Roman" size:(12)];
     
     
     UITextView * urlView = [[UITextView alloc] initWithFrame:CGRectMake(100, 40, 200, 60)];
     urlView.text = profileInfo[@"github"];
     [self.contentView addSubview:urlView];
     urlView.backgroundColor = [UIColor lightGrayColor];
     urlView.font = [UIFont fontWithName:@"Times New Roman" size:(12)];

    
    


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


