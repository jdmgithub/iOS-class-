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
    NSArray *listItems;
//    NSArray *listImages;
//    NSArray *listUrls;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        //NSDictionary * listExample = [[NSDictionary alloc] initWithObjects:(@"Savitha Reddy") forKeys:@[@n *"name"]];
        /*
         NSDictionary * list = @{
                                @"name" : @"Savitha Reddy",
                                @"image" : [UIImage imageNamed: @"savithareddy"]
                                };
         */
        
        listItems = @[
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
                      ];
        
//        //listItems = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday", @"Wednesday", nil];
//        listItems = @[@"Ali Houshmand",
//                      @"Ashby Thornwell",
//                      @"Austen Johnson",
//                      @"Austin Nolan",
//                      @"Derek Weber",
//                      @"Ed Salter",
//                      @"Heidi Proske",
//                      @"Jeff King",
//                      @"Jeffrey Moulds",
//                      @"Jisha Obukwelu",
//                      @"Jo Albright",
//                      @"Jon Fox",
//                      @"John Yam",
//                      @"Savitha Reddy",
//                      @"T.J. Mercer",
//                      @"Teddy Conyers"];
//        
//        
//        listImages = @[
//                        [UIImage imageNamed:@"alihoushmand"],
//                        [UIImage imageNamed:@"ashbythornwell"],
//                        [UIImage imageNamed:@"austenjohnson" ],
//                        [UIImage imageNamed:@"austinnolan" ],
//                        [UIImage imageNamed:@"derekweber" ],
//                        [UIImage imageNamed:@"edsalter" ],
//                        [UIImage imageNamed:@"heidiproske" ],
//                        [UIImage imageNamed:@"jeffking" ],
//                        [UIImage imageNamed:@"jeffreymoulds" ],
//                        [UIImage imageNamed:@"jishaobukwelu" ],
//                        [UIImage imageNamed:@"joalbright" ],
//                        [UIImage imageNamed:@"jonfox" ],
//                        [UIImage imageNamed:@"johnyam" ],
//                        [UIImage imageNamed:@"savithareddy" ],
//                        [UIImage imageNamed:@"tjmercer" ],
//                        [UIImage imageNamed:@"teddyconyers"]
//                        ];
        
        self.tableView.contentInset = UIEdgeInsetsMake(35, 0, 0, 0);
        self.tableView.rowHeight = 100;
        
        UIView * header =[[UIView alloc] initWithFrame:CGRectMake(0, 0 ,320, 100)];
        header.backgroundColor = [UIColor darkGrayColor];
        self.tableView.tableHeaderView = header;
        
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(20,10,280,30)];
        titleHeader.text = @"GITHUB USERS";
        titleHeader.textColor = [UIColor whiteColor];
        titleHeader.font = [UIFont fontWithName:@"Times New Roman" size:(14)];
        [header addSubview:titleHeader];
        
        
        UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(05, 40, 180, 30)];
        textField.backgroundColor = [UIColor whiteColor];
        textField.font = [UIFont fontWithName:@"Times New Roman" size:(14)];
        [header addSubview:textField];
        
        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 40, 100, 30)];
        submitButton.backgroundColor = [UIColor lightGrayColor];
        submitButton.layer.cornerRadius = 6;
        [submitButton setTitle:@"New User" forState:UIControlStateNormal];
        [submitButton addTarget:(self) action:@selector (newUser) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview:submitButton];
        
        //self.tableView.tableHeaderView = header;
        
        UIView * footer =[[UIView alloc] initWithFrame:CGRectMake(0, 0 ,320, 40)];
        footer.backgroundColor = [UIColor darkGrayColor];
       
        [self.tableView setTableFooterView:footer];
        
        self.tableView.backgroundColor =[UIColor clearColor];
        
        //for(NSString * day in listItems);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [listItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   
//    if (cell==nil)
//    {
//        cell =[[TDLTableViewCell alloc] init];
//        cell.bacground = [UIColor clearColor];
//    }
//  must have {} if there are more than one condition otherwise only what is next to will happen

    if (cell==nil) cell =[[TDLTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
// looking for reusableCellWithIdentifier.
   

//    int index = [indexPath row];
    int index = indexPath.row;
    
//    cell.textLabel.text = listItems[index];
//    cell.imageView.image = listImages[index];
    
    
//  NSDictionary * listItems = [listItems objectAtIndex:index];
    NSDictionary * listItem = listItems[index];
    cell.profileInfo = listItem;
    
//  (custom)
    
//    Default Styling Methods
//    cell.textLabel.text = [listItem objectForKey:@"name"];
//    cell.textLabel.text = listItem[@"name"];
//    [cell imageView] setImage: listItem[@"name"]
//    cell.imageView.image = listItem[@"image"];
    
    
//     cell.textLabel.textColor = [UIColor darkGrayColor];
//     cell.textLabel.font = [UIFont fontWithName: @"Times New Roman" size:(12)];
     cell.backgroundColor = [UIColor clearColor];

    return cell;
}

//- (void)enterUser
//{
//    NSLog(@"A New Friend");
//}

- (void)newUser
{
    NSLog(@"A New Friend");
}
@end
