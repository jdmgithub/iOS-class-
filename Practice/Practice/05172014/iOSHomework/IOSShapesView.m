//
//  IOSTVCTableViewController.m
//  iOSHomework
//
//  Created by Jisha Obukwelu on 5/17/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "IOSShapesView.h"
#import "IOSShapeTableViewCell.h"
#import "IOSTVCTableViewController.h"

@interface IOSShapesView ()

@end

@implementation IOSShapesView
{
    NSArray * shapes;
    IOSShapeTableViewCell * shapeCell;
    IOSTVCTableViewController * iosTVC;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        NSLog(@"%@", self.view.backgroundColor);
        
        shapes = @[@{@"name": @"circle", @"image": [UIImage imageNamed:@"circle"]},
                   @{@"name" : @"square",@"image": [UIImage imageNamed:@"square"]},
                   @{@"name" : @"trapezoid", @"image": [UIImage imageNamed:@"trapezoid"]},
                   ];
        
        self.tableView.rowHeight = 150;
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
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IOSShapeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[IOSShapeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor brownColor];
    }
    
    cell.shapesInfo = shapes[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [shapes count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.tableView reloadData];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
