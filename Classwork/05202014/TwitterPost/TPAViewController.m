//
//  TPAViewController.m
//  TwitterPosts
//
//  Created by Jisha Obukwelu on 5/20/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TPAViewController.h"
#import "STTwitter.h"
#import <CoreLocation/CoreLocation.h>

@interface TPAViewController () <CLLocationManagerDelegate>

@end

@implementation TPAViewController
{
    STTwitterAPI * twitter;
    CLLocationManager * lManager;
    CLLocation * currentLocation;
    
    UITextField * tweetField;
    NSString * locationLat;
    NSString * locationLong;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        lManager = [[CLLocationManager alloc] init];
        lManager.delegate = self;
        [lManager startUpdatingLocation];
        
        twitter = [STTwitterAPI twitterAPIOSWithFirstAccount];
        
        [twitter verifyCredentialsWithSuccessBlock:^(NSString *username)
         {
             NSLog(@"%@", username);
             
         } errorBlock:^(NSError *error) {
             
             NSLog(@"%@", error.userInfo);
         }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int w = [UIScreen mainScreen].bounds.size.width;
    int h = [UIScreen mainScreen].bounds.size.height;
    
    
    tweetField = [[UITextField alloc]initWithFrame:CGRectMake(20, 20, w-40, h-336)];
    tweetField.backgroundColor = [UIColor colorWithRed:0.208f green:0.710f blue:0.843f alpha:1.0f];
    tweetField.placeholder = @"Update Status";
    //    tweetField.textAlignment =
    [self.view addSubview:tweetField];
    
    UIButton * tweetButton = [[UIButton alloc]initWithFrame:CGRectMake(20, h-276, w - 40, 60)];
    tweetButton.backgroundColor = [UIColor colorWithRed:0.208f green:0.710f blue:0.843f alpha:1.0];
    tweetButton.layer.cornerRadius = 30;
    [tweetButton setTitle:@"TWEET IT" forState:UIControlStateNormal];
    [tweetButton addTarget:self action:@selector(postTweet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tweetButton];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation = [locations objectAtIndex:0];
    [lManager stopUpdatingLocation];
    
    locationLat = [NSString stringWithFormat:@"%f",currentLocation.coordinate.latitude];
    locationLong = [NSString stringWithFormat:@"%f",currentLocation.coordinate.longitude ];
}

- (void)postTweet
{
    [twitter postStatusUpdate:tweetField.text inReplyToStatusID:nil latitude:locationLat longitude:locationLong placeID:nil displayCoordinates:nil trimUser:nil successBlock:^(NSDictionary *status) {
        NSLog (@"%@", status);
        NSLog(@"%@, %@", locationLat, locationLong);
        
    } errorBlock:^(NSError *error) {
        
        NSLog(@"%@", error.userInfo);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
