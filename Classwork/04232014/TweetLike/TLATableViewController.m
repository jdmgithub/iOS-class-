//
//  TLATableViewController.m
//  TweetLike
//
//  Created by Jisha Obukwelu on 4/23/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TLATableViewController.h"
#import "TLATableViewCell.h"
#import "TLANavController.h"

@interface TLATableViewController () 

@end

@implementation TLATableViewController
{
    UIView * header;
    UIView * newForm;
//    NSMutableArray * tweetLikes;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        self.tweetLikes = [@[]mutableCopy];
        
        self.tableView.separatorColor = [UIColor blueColor];
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
        self.tableView.rowHeight = 60;
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
    return [self.tweetLikes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[TLATableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.tweetInfo = self.tweetLikes[indexPath.row];
    
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

- (void)printOutTweetsInDictionary
{
    for (NSDictionary* tweetInfo in self.tweetLikes)
    {
        NSLog(@"%@", tweetInfo);
    }
}

- (void)saveData
//saves data
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.tweetLikes];
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
        self.tweetLikes = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
    
}


@end
