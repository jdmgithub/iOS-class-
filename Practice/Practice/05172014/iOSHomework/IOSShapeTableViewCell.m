//
//  IOSShapeTableViewCell.m
//  iOSHomework
//
//  Created by Jisha Obukwelu on 5/18/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "IOSShapeTableViewCell.h"

@implementation IOSShapeTableViewCell
{
    UIImageView * shapeImage;
    UILabel * shapeName;
    UILabel * shapeCaption;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        shapeImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 220, 150)];
        shapeImage.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:shapeImage];
        
        shapeName = [[UILabel alloc] initWithFrame:CGRectMake(75, 75, 100, 20)];
        shapeName.backgroundColor = [UIColor darkGrayColor];
        shapeName.textColor = [UIColor greenColor];
        [self.contentView addSubview:shapeName];
        
        shapeCaption = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 20, 20)];
        shapeCaption.textColor = [UIColor clearColor];
        [self.contentView addSubview:shapeCaption];
    }
    return self;
}

- (void)setShapesInfo:(NSDictionary *)shapesInfo
{
    _shapesInfo = shapesInfo;
    
    shapeImage.image = shapesInfo[@"image"];
    shapeName.text = shapesInfo[@"name"];
    shapeCaption.text = shapesInfo[@"caption"];
    
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
