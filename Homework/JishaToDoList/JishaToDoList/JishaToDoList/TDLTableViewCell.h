//
//  TDLTableViewCell.h
//  JishaToDoList
//
//  Created by Jisha Obukwelu on 4/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDLTableViewCell : UITableViewCell
@property (nonatomic) UILabel * moreToDo;
@property (nonatomic) UIButton * setPriority;
@property (nonatomic) UIView * priorityLevel;
@property (nonatomic) UIView * strikeThrough;

+ (BOOL)askUser;
- (void)showCircleButtons;
- (void)hideCircleButtons;

@end
