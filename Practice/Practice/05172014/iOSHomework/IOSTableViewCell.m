//
//  IOSTableViewCell.m
//  iOSHomework
//
//  Created by Jisha Obukwelu on 5/17/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "IOSTableViewCell.h"

@implementation IOSTableViewCell
{
    UILabel * actualColor;
    UILabel * numberFormat;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        actualColor = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
        [self.contentView addSubview:actualColor];
        
//        numberFormat = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 20)];
//        [self.contentView addSubview:numberFormat];
        
    }
    return self;
}
- (void)setColor: (NSDictionary *)color
{
    _color = color;
    
    actualColor.text = color[@"name"];
    actualColor.backgroundColor = [UIColor clearColor];
    actualColor.font = [UIFont fontWithName:@"Times New Roman" size:(20)];
    
}

//- (void)setNumber:(NSDictionary *)number
//{
//    numberFormat.text = number[@"name"];
//    numberFormat.backgroundColor = [UIColor clearColor];
//    numberFormat.font = [UIFont fontWithName:@"Times New Roman" size:(12)];
//}


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
