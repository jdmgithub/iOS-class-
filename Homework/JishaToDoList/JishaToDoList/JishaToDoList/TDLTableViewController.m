//
//  TDLTableViewController.m
//  JishaToDoList
//
//  Created by Jisha Obukwelu on 4/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLTableViewController.h"
#import "MOVE.h"

@interface TDLTableViewController ()

@end

@implementation TDLTableViewController
{
    NSMutableArray * toDoItems;
    UITextField * toDoField;
    NSArray * priorityColors;
    
    UIButton * button1;
    UIButton * button2;
    UIButton * button3;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        priorityColors = @[FADE_COLOR, GREEN_COLOR, YELLOW_COLOR, RED_COLOR];
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,80)];
        self.tableView.rowHeight = 60;
        self.tableView.layer.cornerRadius = 3;
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        
        toDoItems = [@[]mutableCopy];
        
        [self loadListItems];
        
        toDoField = [[UITextField alloc] initWithFrame:CGRectMake(10,20,140,50)];
        toDoField.placeholder = @"TO DO LIST";
        toDoField.backgroundColor = [UIColor lightGrayColor];
        toDoField.alpha = 0.5;
        toDoField.layer.cornerRadius = 6;
        toDoField.textAlignment = NSTextAlignmentCenter;
        toDoField.font = [UIFont fontWithName:@"Times New Roman" size:(20)];
        
        toDoField.delegate = self;
        
        [self.tableView.tableHeaderView addSubview:toDoField];
        
        button1 = [[UIButton alloc] initWithFrame:CGRectMake(170, 20, 40, 40)];
        button1.tag = 1;
        button1.backgroundColor = GREEN_COLOR;
        button1.layer.cornerRadius = button1.frame.size.width / 2.0;
        [button1 addTarget:(self) action:@selector (addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [self.tableView.tableHeaderView addSubview:button1];
        
        button2 = [[UIButton alloc] initWithFrame:CGRectMake(220, 20, 40, 40)];
        button2.tag = 2;
        button2.backgroundColor = YELLOW_COLOR;
        button2.layer.cornerRadius = button2.frame.size.width / 2.0;
        [button2 addTarget:(self) action:@selector (addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [self.tableView.tableHeaderView addSubview:button2];
        
        button3 = [[UIButton alloc] initWithFrame:CGRectMake(270, 20, 40, 40)];
        button3.tag = 3;
        button3.backgroundColor = RED_COLOR;
        button3.layer.cornerRadius = button3.frame.size.width / 2.0;
        [button3 addTarget:(self) action:@selector (addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [self.tableView.tableHeaderView addSubview:button3];
    }
    return self;
}


- (void)deleteItem:(TDLTableViewCell *)cell
{
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    
    [toDoItems removeObjectAtIndex:indexPath.row];
    
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)setItemPriority:(int)priority withItem: (TDLTableViewCell *)cell
{
    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    
    NSDictionary * toDoItem = toDoItems[indexPath.row];
    
    NSDictionary * updateToDoItem = @{
                                      @"name" : toDoItem[@"name"],
                                      @"priority" : @(priority),
                                      @"constant" : @(priority)
                                      };
    // remove old dictionary at cell
    [toDoItems removeObjectAtIndex:indexPath.row];
    
    //add new dictionary for cell
    [toDoItems insertObject:updateToDoItem atIndex:indexPath.row];
    
    cell.priorityLevel.backgroundColor = priorityColors[priority];
    
    [MOVE animateView:cell.priorityLevel properties:@{@"x":@10, @"duration":@0.5}];
    [cell hideCircleButtons];
    cell.swiped = NO;
    
    NSLog(@"Priority : %d", priority);
    
    [self saveData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
//return key makes keyboard go away
{
    NSLog(@"Returned");
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void) addNewListItem:(id)sender;
//logs what happens when you type in field and touch a specific button
{
    UIButton * button = (UIButton *)sender;
    NSString * name = toDoField.text;
    
    if(![name isEqualToString:@""])
    {
        [toDoItems insertObject:@{@"name":name, @"priority" : @(button.tag), @"constant" : @(button.tag)} atIndex:0];
    };
    
    NSLog(@"%@", sender);
    
    //after clicking a button keyboard goes away
    [toDoField resignFirstResponder];

    [self.tableView reloadData];
    
    [self saveData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//creates new cells as you input information
{
    return [toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//strikesthrough and changes priority to 0
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell==nil)
    {
        cell =[[TDLTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    [cell resetLayout];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.delegate = self;
    
    NSDictionary * toDoItem = toDoItems[indexPath.row];
    
    cell.priorityLevel.backgroundColor = priorityColors[[toDoItem[@"priority"] intValue]];
    
    if([toDoItem[@"priority"] intValue] == 0)
    {
        cell.strikeThrough.alpha = 1;
        cell.whiteButton.alpha = 0;
        
    } else {
        cell.strikeThrough.alpha = 0;
        cell.whiteButton.alpha = 1;
    }

    cell.moreToDo.text = toDoItem[@"name"];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:swipeRight];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//what happens when a cell is selected
{
    // get cell from tableview at row
    TDLTableViewCell *cell = (TDLTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    
    //do not strike through if cell is moved
    if(cell.swiped) return;
    
    
    NSDictionary * toDoItem = toDoItems[indexPath.row];
    NSDictionary * updateToDoItem;
    
    if([toDoItem[@"priority"] intValue])
    {   //set cell background to done color
        
        cell.priorityLevel.backgroundColor = priorityColors[0];
        cell.strikeThrough.alpha = 1;
        cell.whiteButton.alpha = 0;
        
        //create new dictionary with done priority
        updateToDoItem = @{@"name" : toDoItem[@"name"],
                                           @"priority" : @0,
                                           @"constant" : toDoItem[@"constant"]
                           };
            } else {
        //undo action
        cell.priorityLevel.backgroundColor = priorityColors[[toDoItems[indexPath.row][@"constant"] intValue]];
        cell.strikeThrough.alpha = 0;
        cell.whiteButton.alpha = 1;
        
        //create new dictionary with done priority
        updateToDoItem = @{@"name" : toDoItem[@"name"],
                                           @"priority" : toDoItem[@"constant"],
                                           @"constant" : toDoItem[@"constant"]
                           };
            }
    
    // remove old dictionary at cell
    [toDoItems removeObjectAtIndex:indexPath.row];
    
    //add new dictionary for cell
    [toDoItems insertObject:updateToDoItem atIndex:indexPath.row];
    
    
    [self saveData];
}

- (void)swipeCell:(UISwipeGestureRecognizer *)gesture
{
    TDLTableViewCell * cell = (TDLTableViewCell *)gesture.view;
    
    NSInteger index = [self.tableView indexPathForCell:cell].row;
    
    NSDictionary * toDoItem = toDoItems[index];
    
    int completed = ([toDoItem[@"priority"] intValue] == 0) ? 10 : 0;
    
    //gesture.direction == left : 2
    //gesture.direction == right :1
    //gesture.direction == left && priority == 12:
    //gesture.direction == right && priority == 11:
    
    //swipe left or right
    
    switch (gesture.direction + (completed)) {
        case 1://right
            
            NSLog(@"swiping right");
            
            [MOVE animateView:cell.priorityLevel properties:@{@"x":@10,@"duration":@0.5}];
            [cell hideCircleButtons];
            cell.swiped = NO;
            break;
            
        case 2://left
            
            NSLog(@"swiping left");
            
            [MOVE animateView:cell.priorityLevel properties:@{@"x":@-147, @"duration":@0.5}];
            [cell showCircleButtons];
            cell.swiped = YES;
            break;
         
        case 11://right and priority
            
            [MOVE animateView:cell.priorityLevel properties:@{@"x":@10,@"duration":@0.5}];
            [cell hideDeleteButton];
            cell.swiped = NO;
            break;
            
        case 12://left and priority
            
            [MOVE animateView:cell.priorityLevel properties:@{@"x":@-47, @"duration":@0.5}];
            [cell showDeleteButton];
            cell.swiped = YES;
            break;

        default:
            break;
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)saveData
//saves data
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:toDoItems];
    [data writeToFile:path options:NSDataWritingAtomic error:nil];
}

- (NSString *)listArchivePath
//sets directory
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = documentDirectories[0];
    return [documentDirectory stringByAppendingPathComponent:@"listdata.data"];
}

- (void)loadListItems
//what happens when your to do list is loaded
{
    NSString *path = [self listArchivePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        toDoItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
