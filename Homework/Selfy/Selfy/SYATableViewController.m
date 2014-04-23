//
//  SYATableViewController.m
//  Selfy
//
//  Created by Jisha Obukwelu on 4/21/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "SYATableViewController.h"
#import "SYATableViewCell.h"
#import <Parse/Parse.h>

@interface SYATableViewController ()

@end

@implementation SYATableViewController
{
    UITableViewHeaderFooterView * header;
    UIButton * settings;
    UIButton * addNew;
    NSMutableArray * selfies;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        selfies = [@[
                       @{@"image": @"https://scontent-b-atl.xx.fbcdn.net/hphotos-prn2/t1.0-9/1186039_10151986279756439_860063747_n.jpg",
                         @"name": @"Jiobu",
                         @"caption": @"New Apple Developer",
                         @"avatar": @"https://fbcdn-sphotos-h-a.akamaihd.net/hphotos-ak-frc1/t1.0-9/1962676_10151986272971439_776488807_n.jpg"
                        },
                       ]mutableCopy];

        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        self.tableView.rowHeight = 500;
        
        header = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, 350, 60)];
        NSLog(@"%@",self.tableView.tableHeaderView);
        
        self.tableView.tableHeaderView = header;
        
        settings = [[UIButton alloc] initWithFrame:CGRectMake(10, 0, 60, 60)];
        settings.layer.cornerRadius = 30;
        settings.backgroundColor = [UIColor redColor];
        settings.titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:(10)];
        settings.titleLabel.textColor = [UIColor blackColor];
        [settings  setTitle:@"SETTINGS" forState:UIControlStateNormal];
        
        [header addSubview:settings];
        
        addNew = [[UIButton alloc] initWithFrame:CGRectMake(80, 0, 60, 60)];
        addNew.layer.cornerRadius = 30;
        addNew.backgroundColor = [UIColor redColor];
        addNew.titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:(10)];
        addNew.titleLabel.textColor = [UIColor blackColor];
        [addNew  setTitle:@"ADD NEW" forState:UIControlStateNormal];
        
        [header addSubview:addNew];
        
               self.tableView.rowHeight = self.tableView.frame.size.width + 100;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [selfies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SYATableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[SYATableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];        
        cell.selfyInfo = selfies[indexPath.row];
    }
    // Configure the cell..
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
