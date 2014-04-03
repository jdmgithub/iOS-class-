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
    NSArray *listImages;
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
                      @{@"name":@"Ali Houshmand", @"image":[UIImage imageNamed:@"alihoushmand"]},
                      @{@"name":@"Ashby Thornwell", @"image":[UIImage imageNamed:@"ashbythornwell"]},
                      @{@"name":@"Austen Johnson", @"image":[UIImage imageNamed:@"austenjohnson"]},
                      @{@"name":@"Austin Nolan", @"image":[UIImage imageNamed:@"austinnolan"]},
                      @{@"name":@"Derek Weber", @"image":[UIImage imageNamed:@"derekweber"]},
                      @{@"name":@"Ed Salter", @"image":[UIImage imageNamed:@"edsalter"]},
                      @{@"name":@"Heidi Proske", @"image":[UIImage imageNamed:@"heidiproske"]},
                      @{@"name":@"Jeff King", @"image":[UIImage imageNamed:@"jeffking"]},
                      @{@"name":@"Jeffrey Moulds",@"image":[UIImage imageNamed:@"jeffreymoulds"]},
                      @{@"name":@"Jisha Obukwelu", @"image":[UIImage imageNamed:@"jishaobukwelu"]},
                      @{@"name":@"Jo Albright", @"image":[UIImage imageNamed:@"joalbright"]},
                      @{@"name":@"Jon Fox", @"image":[UIImage imageNamed:@"jonfox"]},
                      @{@"name":@"John Yam", @"image":[UIImage imageNamed:@"johnyam"]},
                      @{@"name":@"Savitha Reddy", @"image":[UIImage imageNamed:@"savithareddy"]},
                      @{@"name":@"T.J. Mercer", @"image":[UIImage imageNamed:@"tjmercer"]},
                      @{@"name":@"Teddy Conyers", @"image":[UIImage imageNamed:@"teddyconyers"]},
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
        
        UIView * header =[[UIView alloc] initWithFrame:CGRectMake(0, 0 ,320, 40)];
        header.backgroundColor = [UIColor darkGrayColor];
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(15,10,280,20)];
        titleHeader.text = @"Contacts";
        titleHeader.textColor = [UIColor whiteColor];
        titleHeader.font = [UIFont fontWithName:@"Times New Roman" size:(14)];
        [header addSubview:titleHeader];
        
        //self.tableView.tableHeaderView = header;
        [self.tableView setTableHeaderView:header];
        
        UIView * footer =[[UIView alloc] initWithFrame:CGRectMake(0, 0 ,320, 40)];
        footer.backgroundColor = [UIColor darkGrayColor];
        [self.tableView setTableFooterView:footer];
        
        self.tableView.backgroundColor =[UIColor lightGrayColor];
        
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
     cell.backgroundColor = [UIColor lightGrayColor];

    return cell;
}

@end
