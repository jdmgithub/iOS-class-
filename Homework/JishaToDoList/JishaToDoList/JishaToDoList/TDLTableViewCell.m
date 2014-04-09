//
//  TDLTableViewCell.m
//  JishaToDoList
//
//  Created by Jisha Obukwelu on 4/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLTableViewCell.h"

@implementation TDLTableViewCell
{
    UILabel * moreToDo;
    UIButton * setPriority;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        moreToDo = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 200, 60)];
        [self.contentView addSubview:moreToDo];
        setPriority = [[UIButton alloc] initWithFrame:CGRectMake(100, 20, 50, 50)];
        setPriority.layer.cornerRadius = 25;
        [self.contentView addSubview:setPriority];

    }
    return self;
}
- (void)setToDoItems: (NSDictionary *)toDoItems
{
    moreToDo.text = toDoItems[@"To Do List"];
    moreToDo.backgroundColor = [UIColor clearColor];
    moreToDo.font = [UIFont fontWithName:@"Times New Roman" size:(12)];
    
    setPriority.backgroundColor = [UIColor clearColor];
    
    toDoItems = toDoItems;
    
}


- (void)awakeFromNib
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
