//
//  TDLViewController.m
//  ToDoLists
//
//  Created by Jisha Obukwelu on 5/6/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TDLViewController.h"
#import "TDLTableViewController.h"
#import "TDLGitHubRequest.h"
#import "TDLSingleton.h"

@interface TDLViewController () <UITextFieldDelegate>


@end

@implementation TDLViewController
{
    UITextField * textField;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {    }
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

- (void)newUser
{
    NSString * username = textField.text;
    textField.text =@"";
    NSDictionary * userInfo = [TDLGitHubRequest getUserWithUsername:username];
    
    if([[userInfo allKeys] count] ==3)
    {
        NSLog(@"%@",userInfo);
        [[TDLSingleton sharedCollection] addListItem:userInfo];
    } else {
        NSLog(@"not enough data");
        
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Not Enough Information" message:@"Unable to Add User" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        
        [alertView show];
    }
    
    [textField resignFirstResponder];
}



@end
