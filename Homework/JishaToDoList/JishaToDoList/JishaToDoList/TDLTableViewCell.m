//
//  TDLTableViewCell.m
//  JishaToDoList
//
//  Created by Jisha Obukwelu on 4/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLTableViewCell.h"
#import "Move.h"

@implementation TDLTableViewCell
{
    UIButton * button1;
    UIButton * button2;
    UIButton * button3;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.priorityLevel = [[UIView alloc] initWithFrame:CGRectMake(10,0, self.frame.size.width -20, 40)];
        self.priorityLevel.layer.cornerRadius = 6;
        self.priorityLevel.alpha = 0.9;
        
        [self.contentView addSubview:self.priorityLevel];
        
        self.moreToDo = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 50)];
        self.moreToDo.textColor = [UIColor whiteColor];
        self.moreToDo.font = [UIFont fontWithName:@"Times New Roman" size:34];
        [self.priorityLevel addSubview:self.moreToDo];
        
        self.strikeThrough = [[UIView alloc] initWithFrame:CGRectMake(5, 26, self.frame.size.width - 30, 2)];
        self.strikeThrough.backgroundColor = [UIColor whiteColor];
        self.strikeThrough.alpha = 0;
        [self.priorityLevel addSubview:self.strikeThrough];

        self.whiteButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 50, 10, 20, 20)];
        self.whiteButton.layer.cornerRadius = 10;
        self.whiteButton.backgroundColor = [UIColor whiteColor];
        [_whiteButton addTarget:(self) action:@selector (buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.priorityLevel addSubview:self.whiteButton];
    }
    return self;
}

- (void)resetLayout
{
    self.priorityLevel.frame = CGRectMake(10,0, self.frame.size.width -20, 40);
    [button1 removeFromSuperview];
    [button2 removeFromSuperview];
    [button3 removeFromSuperview];
    self.swiped = NO;
}

- (void)createButtons
{
    button1 = [[UIButton alloc] initWithFrame:CGRectMake(170, 0, 40, 40)];
    button1.tag = 1;
    button1.alpha = 0;
    button1.backgroundColor = GREEN_COLOR;
    button1.layer.cornerRadius = button1.frame.size.width / 2.0;
    [button1 addTarget:(self) action:@selector (pressPriorityButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button1];
    
    button2 = [[UIButton alloc] initWithFrame:CGRectMake(220, 0, 40, 40)];
    button2.tag = 2;
    button2.alpha = 0;
    button2.backgroundColor = YELLOW_COLOR;
    button2.layer.cornerRadius = button1.frame.size.width / 2.0;
    [button2 addTarget:(self) action:@selector (pressPriorityButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button2];
    
    button3 = [[UIButton alloc] initWithFrame:CGRectMake(270, 0, 40, 40)];
    button3.tag = 3;
    button3.alpha = 0;
    button3.backgroundColor = RED_COLOR;
    button3.layer.cornerRadius = button3.frame.size.width / 2.0;
    [button3 addTarget:(self) action:@selector (pressPriorityButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button3];
}

- (void)pressPriorityButton:(id)sender
{
    UIButton * button = (UIButton *)sender;
    
    [self.delegate setItemPriority:(int)button.tag withItem:self];
}

- (void)showCircleButtons
{
    [self createButtons];
    
    [MOVE animateView:button1 properties:@{@"alpha":@1, @"duration":@0.2, @"delay":@0.3}];
    [MOVE animateView:button2 properties:@{@"alpha":@1, @"duration":@0.2, @"delay":@0.2}];
    [MOVE animateView:button3 properties:@{@"alpha":@1, @"duration":@0.2, @"delay":@0.1}];
}

- (void)hideCircleButtons
{
    [MOVE animateView:button1 properties:@{@"alpha":@0, @"duration":@0.0, @"delay":@0.1, @"remove":@YES}];
    [MOVE animateView:button2 properties:@{@"alpha":@0, @"duration":@0.1, @"delay":@0.2, @"remove":@YES}];
    [MOVE animateView:button3 properties:@{@"alpha":@0, @"duration":@0.2, @"delay":@0.3, @"remove":@YES}];
}

- (void)showDeleteButton
{
    button3 = [[UIButton alloc] initWithFrame:CGRectMake(270, 0, 40, 40)];
    button3.alpha = 0;
    button3.backgroundColor = RED_COLOR;
    button3.layer.cornerRadius = button3.frame.size.width / 2.0;
    
    [button3 addTarget:(self) action:@selector (pressDeleteButton) forControlEvents:UIControlEventTouchUpInside];
    
    [button3 setTitle:@"DELETE" forState:UIControlStateNormal];
    button3.titleLabel.font =[UIFont fontWithName:@"Times New Roman" size:(10)];
    
    [self.contentView addSubview:button3];
    
    [MOVE animateView:button3 properties:@{@"alpha":@1, @"duration":@0.2, @"delay":@0.3}];
}

-(void)buttonPressed:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Changing Priority"
                                                   message: @"Do you want to change the priority?"
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
    
    alert.delegate = self;
    
    
    [alert show];
    [alert frame];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"alert clicked : %d",buttonIndex);
    
//    // 0 cancel
//    // 1 ok
//   switch (gesture.direction) {
//        case 1://0 Cancel
//           
//           NSLog(@"Cancel");
//           
//            return cell;
//            break;
//           
//        case 2://1 Ok
//           
//            NSLog(@"Ok");
//           
//            [MOVE animateView:cell.priorityLevel properties:@{@"x":@-147, @"duration":@0.5}];
//            [cell showCircleButtons];
//           cell.swiped = YES;
//            break;
//    }
    
}


- (void)pressDeleteButton
//self is the Table View Controller
{
    [self.delegate deleteItem:self];
}
- (void)hideDeleteButton
{
   [MOVE animateView:button3 properties:@{@"alpha":@0, @"duration":@0.2, @"delay":@0.0, @"remove":@YES}];
}

- (void)awakeFromNib
{
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
