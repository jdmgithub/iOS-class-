//
//  TDLTableViewController.m
//  ToDoLists
//
//  Created by Jisha Obukwelu on 4/2/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"

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
               listItems = [@[
                      @{@"name":@"Ali Houshmand", @"image":[UIImage imageNamed:@"alihoushmand"], @"github": @"https://github.com/HoushmandA06"},
                      @{@"name":@"Ashby Thornwell", @"image":[UIImage imageNamed:@"ashbythornwell"], @"github": @"https://github.com/athornwell"},
                      @{@"name":@"Austen Johnson", @"image":[UIImage imageNamed:@"austenjohnson"], @"github": @"https://github.com/ajohnson21"},
                      @{@"name":@"Austin Nolan", @"image":[UIImage imageNamed:@"austinnolan"], @"github": @"https://github.com/adnolan99"},
                      @{@"name":@"Derek Weber", @"image":[UIImage imageNamed:@"derekweber"], @"github": @"https://github.com/dweber03"},
                      @{@"name":@"Ed Salter", @"image":[UIImage imageNamed:@"edsalter"], @"github": @"https://github.com/MadArkitekt"},
                      @{@"name":@"Heidi Proske", @"image":[UIImage imageNamed:@"heidiproske"], @"github": @"https://github.com/justagirlcoding"},
                      @{@"name":@"Jeff King", @"image":[UIImage imageNamed:@"jeffking"], @"github": @"https://github.com/rampis"},
                      @{@"name":@"Jeffrey Moulds",@"image":[UIImage imageNamed:@"jeffreymoulds"], @"github": @"https://github.com/jdmgithub"},
                      @{@"name":@"Jisha Obukwelu", @"image":[UIImage imageNamed:@"jishaobukwelu"], @"github": @"https://github.com/Jiobu"},
                      @{@"name":@"Jo Albright", @"image":[UIImage imageNamed:@"joalbright"], @"github": @"https://github.com/joalbright"},
                      @{@"name":@"Jon Fox", @"image":[UIImage imageNamed:@"jonfox"], @"github": @"https://github.com/FoxJon"},
                      @{@"name":@"John Yam", @"image":[UIImage imageNamed:@"johnyam"], @"github": @"https://github.com/yamski"},
                      @{@"name":@"Savitha Reddy", @"image":[UIImage imageNamed:@"savithareddy"], @"github": @"https://github.com/savithareddy"},
                      @{@"name":@"T.J. Mercer", @"image":[UIImage imageNamed:@"tjmercer"], @"github": @"https://github.com/gwanunig14"},
                      @{@"name":@"Teddy Conyers", @"image":[UIImage imageNamed:@"teddyconyers"], @"github": @"https://github.com/talented76"}
                      ] mutableCopy];
        
        
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
    
    UIWindow * window = UIApplication.sharedApplication.windows.firstObject;
    
    UINavigationController * navController = (UINavigationController *)
    window.rootViewController;
    
    [navController pushViewController:webController animated:YES];
    
    NSURL * url = [NSURL URLWithString:listItem[@"github"]];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
}

- (NSDictionary *)getListItem: (NSInteger)row
{
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
}

- (void)newUser
{
    NSString * userName = nameField.text;
    NSLog(@"%@",userName);
    nameField.text =@"";
      [listItems addObject:@{
                           @"name":userName,
                           @"image":[UIImage imageNamed:@"defaultuser"],
                           @"github": [NSString stringWithFormat:@"https://github.com/%@",userName] }
     ];
    [nameField resignFirstResponder];
    [self.tableView reloadData];
    NSLog(@"listItems Count :%d",[listItems count]);
    }

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
 
    [self newUser];
    return YES;
}


@end
