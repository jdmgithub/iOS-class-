//
//  TDLTableViewCell.h
//  JishaToDoList
//
//  Created by Jisha Obukwelu on 4/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <UIKit/UIKit.h>

//declaring protocol
@protocol TDLTableViewCellDeglegate;

@interface TDLTableViewCell : UITableViewCell <UIAlertViewDelegate>

//have it twice because it is needed  to call certain property

@property (nonatomic, assign)id<TDLTableViewCellDeglegate> delegate;

@property (nonatomic) UILabel * moreToDo;
@property (nonatomic) UIButton * whiteButton;
@property (nonatomic) UIView * priorityLevel;
@property (nonatomic) UIView * strikeThrough;

@property (nonatomic) BOOL swiped;

- (void)resetLayout;

- (void)showCircleButtons;
- (void)hideCircleButtons;

- (void)showDeleteButton;
- (void)hideDeleteButton;

@end

@protocol TDLTableViewCellDeglegate <NSObject>

-(void)buttonPressed:(id)sender;

//deletes Item
- (void)deleteItem:(TDLTableViewCell *)cell ;

//gets priority when pushed
- (void)setItemPriority:(int)priority withItem: (TDLTableViewCell *)cell;

@optional

- (void)optionalMethod;


@end

