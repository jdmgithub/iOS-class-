//
//  TDLTableViewController.m
//  ToDoLists
//
//  Created by Jisha Obukwelu on 4/2/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"
#import "TDLGitHubRequest.h"

@implementation TDLTableViewController

{
    NSMutableArray *listItems;
    UITextField * nameField;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
//               listItems = [@[
//                      @{@"name":@"Ali Houshmand", @"image":[UIImage imageNamed:@"alihoushmand"], @"github": @"https://github.com/HoushmandA06"},
//                      @{@"name":@"Ashby Thornwell", @"image":[UIImage imageNamed:@"ashbythornwell"], @"github": @"https://github.com/athornwell"},
//                      @{@"name":@"Austen Johnson", @"image":[UIImage imageNamed:@"austenjohnson"], @"github": @"https://github.com/ajohnson21"},
//                      @{@"name":@"Austin Nolan", @"image":[UIImage imageNamed:@"austinnolan"], @"github": @"https://github.com/adnolan99"},
//                      @{@"name":@"Derek Weber", @"image":[UIImage imageNamed:@"derekweber"], @"github": @"https://github.com/dweber03"},
//                      @{@"name":@"Ed Salter", @"image":[UIImage imageNamed:@"edsalter"], @"github": @"https://github.com/MadArkitekt"},
//                      @{@"name":@"Heidi Proske", @"image":[UIImage imageNamed:@"heidiproske"], @"github": @"https://github.com/justagirlcoding"},
//                      @{@"name":@"Jeff King", @"image":[UIImage imageNamed:@"jeffking"], @"github": @"https://github.com/rampis"},
//                      @{@"name":@"Jeffrey Moulds",@"image":[UIImage imageNamed:@"jeffreymoulds"], @"github": @"https://github.com/jdmgithub"},
//                      @{@"name":@"Jisha Obukwelu", @"image":[UIImage imageNamed:@"jishaobukwelu"], @"github": @"https://github.com/Jiobu"},
//                      @{@"name":@"Jo Albright", @"image":[UIImage imageNamed:@"joalbright"], @"github": @"https://github.com/joalbright"},
//                      @{@"name":@"Jon Fox", @"image":[UIImage imageNamed:@"jonfox"], @"github": @"https://github.com/FoxJon"},
//                      @{@"name":@"John Yam", @"image":[UIImage imageNamed:@"johnyam"], @"github": @"https://github.com/yamski"},
//                      @{@"name":@"Savitha Reddy", @"image":[UIImage imageNamed:@"savithareddy"], @"github": @"https://github.com/savithareddy"},
//                      @{@"name":@"T.J. Mercer", @"image":[UIImage imageNamed:@"tjmercer"], @"github": @"https://github.com/gwanunig14"},
//                      @{@"name":@"Teddy Conyers", @"image":[UIImage imageNamed:@"teddyconyers"], @"github": @"https://github.com/talented76"}
//                      ] mutableCopy];
        
        
        listItems =[@[] mutableCopy];
        
        [self loadListItems];
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        self.tableView.rowHeight = 100;
        
        UIView * header =[[UIView alloc] initWithFrame:CGRectMake(0, 0 ,320, 100)];
        header.backgroundColor = [UIColor darkGrayColor];
        self.tableView.tableHeaderView = header;
        
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(20,10,280,30)];
        titleHeader.text = @"GITHUB USERS";
        titleHeader.textColor = [UIColor whiteColor];
        titleHeader.font = [UIFont fontWithName:@"Times New Roman" size:(14)];
        [header addSubview:titleHeader];
        
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(05, 40, 180, 30)];
        nameField.backgroundColor = [UIColor whiteColor];
        nameField.font = [UIFont fontWithName:@"Times New Roman" size:(14)];
        nameField.delegate = self;
        [header addSubview:nameField];
        
        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 40, 100, 30)];
        submitButton.backgroundColor = [UIColor lightGrayColor];
        submitButton.layer.cornerRadius = 6;
        [submitButton setTitle:@"New User" forState:UIControlStateNormal];
        [submitButton addTarget:(self) action:@selector (newUser) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:submitButton];
        
        submitButton.titleLabel.font =[UIFont fontWithName:@"Times New Roman" size:(14)];
        submitButton.titleLabel.textColor =[UIColor darkGrayColor];

        
        UIView * footer =[[UIView alloc] initWithFrame:CGRectMake(0, 0 ,320, 40)];
        footer.backgroundColor = [UIColor darkGrayColor];
        [self.tableView setTableFooterView:footer];
        self.tableView.backgroundColor =[UIColor clearColor];
}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return [listItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) cell =[[TDLTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
     cell.profileInfo = [self getListItem:indexPath.row];
     cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * listItem =[self getListItem:indexPath.row];
    NSLog(@"%@",listItem);
    
    UIViewController * webController = [[UIViewController alloc] init];
    UIWebView * webView = [[UIWebView alloc]init];
    webController.view = webView;
    [self.navigationController pushViewController:webController animated:YES];
    NSURL * url = [NSURL URLWithString:listItem[@"github"]];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * listItem = [self getListItem:indexPath.row];
    
    [listItems removeObjectIdenticalTo:listItem];
    
    TDLTableViewCell *cell = (TDLTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.alpha = 0;
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    [self saveData];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if (sourceIndexPath == destinationIndexPath) return;
// we will switch array objects here
    
    NSDictionary * sourceItem = [self getListItem:sourceIndexPath.row];
    
    NSDictionary * toItem = [self getListItem:destinationIndexPath.row];
    
    [listItems removeObjectIdenticalTo:sourceItem];
    
    [listItems insertObject:sourceItem atIndex:[listItems indexOfObject:toItem]];
    
    [self saveData];
}
- (void)newUser
{
    NSString * username = nameField.text;
    nameField.text =@"";
    NSDictionary * userInfo = [TDLGitHubRequest getUserWithUsername:username];
    
    if([[userInfo allKeys] count] ==3)
    {
        [listItems addObject:userInfo];
    } else {
        NSLog(@"not enough data");
        
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Not Enough Information" message:@"Unable to Add User" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        
        [alertView show];
    }
    
    [nameField resignFirstResponder];
    [self.tableView reloadData];
    [self saveData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
 
    return YES;
}

- (NSDictionary *)getListItem: (NSInteger)row
{
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
}

- (void)saveData
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:listItems];
    [data writeToFile:path options:NSDataWritingAtomic error:nil];
}

- (NSString *)listArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = documentDirectories[0];
    return [documentDirectory stringByAppendingPathComponent:@"listdata.data"];
}

- (void)loadListItems
{
    NSString *path = [self listArchivePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        listItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
}

@end
