//
//  IOSTVCTableViewController.m
//  iOSHomework
//
//  Created by Jisha Obukwelu on 5/17/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "IOSTVCTableViewController.h"
#import "IOSTableViewCell.h"
#import "IOSArray.h"
#import "IOSColorsView.h"
#import "IOSNumbersView.h"
#import "IOSShapeButton.h"
#import "IOSShapesView.h"

@interface IOSTVCTableViewController ()

@end

@implementation IOSTVCTableViewController
{
    UIBarButtonItem * button1;
    UIBarButtonItem * button2;
    
    BOOL colorsIsSelected;
    
    UIViewController * colorsVC;
    UIViewController * numbersVC;
    UIView * selectedColor;
    UIView * selectedNumber;
    
    IOSShapeButton * openShapesDrawer;
    IOSTVCTableViewController * iosTVC;
    IOSShapesView * shapesView;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.view.backgroundColor = [UIColor cyanColor];
        
        colorsIsSelected = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    button1 = [[UIBarButtonItem alloc] initWithTitle:@"COLORS" style:UIBarButtonItemStylePlain target:self action:@selector(launchColorArray)];
    button2 = [[UIBarButtonItem alloc] initWithTitle:@"NUMBERS" style:UIBarButtonItemStylePlain target:self action:@selector(launchNumbersArray)];
    UIBarButtonItem * flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [self setToolbarItems:@[flexible, button1, flexible, button2, flexible]animated:YES];
    
    openShapesDrawer = [[IOSShapeButton alloc] initWithFrame:CGRectMake (0,0,20,20)];
    openShapesDrawer.tintColor = [UIColor orangeColor];
    openShapesDrawer.toggledTintColor = [UIColor redColor];
    
    [openShapesDrawer addTarget:self action:@selector(openDrawer) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * openButton = [[UIBarButtonItem alloc] initWithCustomView:openShapesDrawer];
    self.navigationItem.leftBarButtonItem = openButton;
}

- (void)openDrawer
{
    [openShapesDrawer toggle];
    int X = [openShapesDrawer isToggled] ? SCREEN_WIDTH - 100 : 0;
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.navigationController.view.frame = CGRectMake(X, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        if(![openShapesDrawer isToggled])
        {
            [iosTVC.view removeFromSuperview];
        }
    }];
    
    if([openShapesDrawer isToggled])
    {
        if(shapesView == nil)
            shapesView = [[IOSShapesView alloc] initWithStyle:UITableViewStylePlain];
        
        shapesView.view.frame = CGRectMake(100 - SCREEN_WIDTH, 0, SCREEN_WIDTH - 100, SCREEN_HEIGHT);
        [self.navigationController.view addSubview:shapesView.view];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)launchColorArray
{
    colorsIsSelected = YES;
    [self.tableView reloadData];
}

- (void)launchNumbersArray
{
    colorsIsSelected = NO;
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor cyanColor];
    }
    
    if(colorsIsSelected == YES)
    {
        cell.textLabel.text = [[IOSArray sharedSingleton]allColors][indexPath.row][@"name"];
        cell.backgroundColor = [[IOSArray sharedSingleton]allColors][indexPath.row][@"color"];
        
    } else {
        
        cell.textLabel.text = [[IOSArray sharedSingleton]allNumbers][indexPath.row][@"name"];
        cell.backgroundColor = [UIColor cyanColor];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(colorsIsSelected == YES)
    {
        return [[[IOSArray sharedSingleton] allColors]count];
        
    } else {
        return [[[IOSArray sharedSingleton] allNumbers]count];}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    colorsVC = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    selectedColor = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

    if (colorsIsSelected == YES)
    {
        NSString * colorString =[NSString stringWithFormat:@"%@color",[IOSArray sharedSingleton].colors[indexPath.row][@"color"]];
        SEL colorSelector = NSSelectorFromString(colorString);
        selectedColor.backgroundColor = [UIColor performSelector:colorSelector];
        [colorsVC.view addSubview:selectedColor];
        [self.navigationController pushViewController:colorsVC animated:YES];
        self.navigationController.toolbarHidden = YES;
        
    }else {
        
        
        selectedNumber = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        NSString * colorString =[NSString stringWithFormat:@"%@name",[IOSArray sharedSingleton].numbers[indexPath.row][@"name"]];
        SEL colorSelector = NSSelectorFromString(colorString);
        selectedColor.backgroundColor = [UIColor performSelector:colorSelector];
        [numbersVC.view addSubview:selectedNumber];
        [self.navigationController pushViewController:colorsVC animated:YES];
        self.navigationController.toolbarHidden = YES;
    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
