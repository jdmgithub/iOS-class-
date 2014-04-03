//
//  TDLTableViewController.m
//  ToDoLists
//
//  Created by Jisha Obukwelu on 4/2/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLTableViewController.h"

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
        //listItems = [[NSArray alloc] initWithObjects:@"Monday", @"Tuesday", @"Wednesday", nil];
        listItems = @[@"Ali Houshmand",
                      @"Ashby Thornwell",
                      @"Austen Johnson",
                      @"Austin Nolan",
                      @"Derek Weber",
                      @"Ed Salter",
                      @"Heidi Proske",
                      @"Jeff King",
                      @"Jeffrey Moulds",
                      @"Jisha Obukwelu",
                      @"Jo Albright",
                      @"Jon Fox",
                      @"John Yam",
                      @"Savitha Reddy",
                      @"T.J. Mercer",
                      @"Teddy Conyers"];
        
        
        listImages = @[
                        [UIImage imageNamed:@"alihoushmand"],
                        [UIImage imageNamed:@"ashbythornwell"],
                        [UIImage imageNamed:@"austenjohnson" ],
                        [UIImage imageNamed:@"austinnolan" ],
                        [UIImage imageNamed:@"derekweber" ],
                        [UIImage imageNamed:@"edsalter" ],
                        [UIImage imageNamed:@"heidiproske" ],
                        [UIImage imageNamed:@"jeffking" ],
                        [UIImage imageNamed:@"jeffreymoulds" ],
                        [UIImage imageNamed:@"jishaobukwelu" ],
                        [UIImage imageNamed:@"joalbright" ],
                        [UIImage imageNamed:@"jonfox" ],
                        [UIImage imageNamed:@"johnyam" ],
                        [UIImage imageNamed:@"savithareddy" ],
                        [UIImage imageNamed:@"tjmercer" ],
                        [UIImage imageNamed:@"teddyconyers"]
                        ];
        
        self.tableView.contentInset = UIEdgeInsetsMake(35, 0, 0, 0);
        //self.tableView.rowHeight = 100;
        
        UIView * header =[[UIView alloc] initWithFrame:CGRectMake(0, 0 ,320, 40)];
        header.backgroundColor = [UIColor blackColor];
        
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(15,10,280,20)];
        titleHeader.text = @"Contacts";
        titleHeader.textColor = [UIColor whiteColor];
        [header addSubview:titleHeader];
        
        //self.tableView.tableHeaderView = header;
        [self.tableView setTableHeaderView:header];
        
        UIView * footer =[[UIView alloc] initWithFrame:CGRectMake(0, 0 ,320, 40)];
        footer.backgroundColor = [UIColor blackColor];
        
        [self.tableView setTableFooterView:footer];
        
        self.tableView.backgroundColor =[UIColor redColor];
        
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell==nil) cell =[[UITableViewCell alloc] init];
    
    int index = [indexPath row];
    
    cell.textLabel.text = listItems[index];
    cell.imageView.image = listImages[index];
    
    cell.backgroundColor = [UIColor redColor];
    

    return cell;
}

@end
