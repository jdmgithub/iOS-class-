//
//  TTMViewController.m
//  TTM
//
//  Created by Jisha Obukwelu on 6/9/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TTMViewController.h"
#import <Parse/Parse.h>

@interface TTMViewController ()

@end

@implementation TTMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //subscribe to a channel
        PFInstallation * currentInstallation = [PFInstallation currentInstallation];
        [currentInstallation addUniqueObject:@"Braves" forKey:@"channels"];
        [currentInstallation saveInBackground];
        
        //push to a channel
        PFPush * push = [[PFPush alloc]init];
        [push setChannel:@"Braves"];
        
        [push setMessage:@"Braves Win!"];
        
        [push sendPushInBackground];
        
        //push based on a query
        PFQuery * query = [PFQuery queryWithClassName:@"User"];
        [query whereKey:@"age" greaterThan:@(21)];
        
        PFPush * pushWithQuery = [[PFPush alloc]init];
        [pushWithQuery setQuery:query];
        
        [pushWithQuery setMessage:@"Beer is Awesome"];
        
        [pushWithQuery sendPushInBackground];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
