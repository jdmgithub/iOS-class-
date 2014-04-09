//
//  TDLTableViewController.m
//  JishaToDoList
//
//  Created by Jisha Obukwelu on 4/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"

@interface TDLTableViewController ()

@end

@implementation TDLTableViewController
{
    NSMutableArray * toDoItems;
    UITextField * toDoField;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        toDoItems = [@[]mutableCopy];
       
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,100)];
        self.tableView.tableHeaderView = header;
        header.backgroundColor = [UIColor purpleColor];
            
        toDoField = [[UITextField alloc] initWithFrame:CGRectMake(5,40,150,50)];
        toDoField.placeholder = @"TO DO LIST";
        toDoField.backgroundColor = [UIColor whiteColor];
        toDoField.textAlignment = NSTextAlignmentCenter;
        toDoField.font = [UIFont fontWithName:@"Times New Roman" size:(14)];
        [header addSubview:toDoField];

        UIView * footer = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,50)];
        self.tableView.tableFooterView = footer;
        footer.backgroundColor = [UIColor purpleColor];
        
        UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(160, 40, 50, 50)];
        button1.backgroundColor = [UIColor greenColor];
        button1.layer.cornerRadius = 25;
        [button1 addTarget:(self) action:@selector (priority1) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:button1];
        
        UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(215, 40, 50, 50)];
        button2.backgroundColor = [UIColor yellowColor];
        button2.layer.cornerRadius = 25;
        [button2 addTarget:(self) action:@selector (priority2) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:button2];
        
        UIButton * button3 = [[UIButton alloc] initWithFrame:CGRectMake(270, 40, 50, 50)];
        button3.backgroundColor = [UIColor redColor];
        button3.layer.cornerRadius = 25;
        [button3 addTarget:(self) action:@selector (priority3) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:button3];
    }
    return self;
}
-(void)priority1
{
    NSString * list = toDoField.text;
    NSLog(@"Must Do!");
}
-(void)priority2
{
    NSLog(@"Nice To Do");
}
-(void)priority3
{
    NSLog(@"Can Wait");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [toDoItems count];
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
//
//    // Configure the cell...
//
//    return cell;
//}
//
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//        return YES;
//}
//
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
//}
//
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
//{
//}
//
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the item to be re-orderable.
//    return YES;
//}
//
//
//
@end
