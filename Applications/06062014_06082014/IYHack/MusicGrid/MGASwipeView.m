//
//  MGAViewController.m
//  MusicGrid
//
//  Created by Jisha Obukwelu on 6/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "MGASwipeView.h"
#import "MGAPreferenceArray.h"
#import <FacebookSDK/FacebookSDK.h>
#import "MGASingleton.h"
#import "MGALogin.h"
#import "MGAGenre.h"

@interface MGASwipeView ()<FBLoginViewDelegate>
@end

@implementation MGASwipeView
{
    BOOL swiped;
    UIView * albums;
    UIView * albumViews;
    UIImageView * profilePic;
    UILabel * nameLabel;
    UIImage * avatar1;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem * logOut = [[UIBarButtonItem alloc] initWithTitle:@"LOG OUT" style:UIBarButtonItemStylePlain target:self action:@selector(logOut:)];
    logOut.tintColor = [UIColor darkGrayColor];
    self.navigationItem.rightBarButtonItem = logOut;
    
    UIBarButtonItem * button1 = [[UIBarButtonItem alloc] initWithTitle:@"Likes" style:UIBarButtonItemStyleBordered target:self action:@selector(goToLikesPage:)];
    UIBarButtonItem * button2 = [[UIBarButtonItem alloc] initWithTitle:@"Genres" style:UIBarButtonItemStyleBordered target:self action:@selector(goToGenresPage:)];
    UIBarButtonItem * button3 = [[UIBarButtonItem alloc] initWithTitle:@"Discovery" style:UIBarButtonItemStyleBordered target:self action:@selector(goToDiscoverPage:)];
    UIBarButtonItem * flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self setToolbarItems:@[flexible, button3, flexible, button1, flexible, button2, flexible] animated:YES];
    
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 40, 80, 40)];
    nameLabel.text = [MGASingleton sharedData].userName;
    nameLabel.adjustsFontSizeToFitWidth = YES;
    
    NSLog(@"%@", [MGASingleton sharedData].userName);
    [self.view addSubview:nameLabel];

    albums = [[UIView alloc] initWithFrame:CGRectMake(35, 125, 250, 250)];
    albums.backgroundColor = [UIColor blackColor];
    [self.view addSubview:albums];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeViews:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeViews:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeViews:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeViews:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
}

- (void) swipeViews : (UISwipeGestureRecognizer *)gesture
{
    albumViews = (UIView *)gesture.view;
    
    switch (gesture.direction) {
        case 2://left
        {
            NSLog(@"swiping Left");
            [UIView animateWithDuration:0.5 animations:^{
                
                albums.frame = CGRectMake(- 250, 125, 250, 250);
                
                [[MGAPreferenceArray sharedArrays].likes addObject:albums];
                
            } completion:^(BOOL finished) {
                
                albumViews = [[UIView alloc]initWithFrame:CGRectMake(35, 125, 250, 250)];
                albumViews.backgroundColor = [UIColor blackColor];
                [self.view addSubview:albumViews];
                albums = albumViews;
                
            }];
        }
            break;
            
        case 4://up
        {
            NSLog(@"swiping Up");
            [UIView animateWithDuration:0.5 animations:^{
                
                albums.frame = CGRectMake(35, -350, 250, 250);
                
                [[MGAPreferenceArray sharedArrays].viewLater addObject:albums];
                
            } completion:^(BOOL finished) {
                
                albumViews = [[UIView alloc]initWithFrame:CGRectMake(35, 125, 250, 250)];
                albumViews.backgroundColor = [UIColor blackColor];
                [self.view addSubview:albumViews];
                albums = albumViews;
                
            }];
        }
            
            break;
            
        case 8://down
        {
            NSLog(@"Swipe Down");
            [UIView animateWithDuration:0.5 animations:^{
                
                albums.frame = CGRectMake(35, 700, 250, 250);
                
                [[MGAPreferenceArray sharedArrays].dislikes addObject:albums];
                
            } completion:^(BOOL finished) {
                
                albumViews = [[UIView alloc]initWithFrame:CGRectMake(35, 125, 250, 250)];
                albumViews.backgroundColor = [UIColor blackColor];
                [self.view addSubview:albumViews];
                albums = albumViews;
            }];
        }
            
            break;
            
            //        case 1://right
            //        {
            //            NSLog(@"swiping Right");
            //            [UIView animateWithDuration:0.5 animations:^{
            //
            //                albums.frame = CGRectMake(50, 500, 250, 250);
            //
            //            } completion:^(BOOL finished) {
            //
            //                albumViews = [[UIView alloc]initWithFrame:CGRectMake(50, 75, 250, 250)];
            //                albumViews.backgroundColor = [UIColor blackColor];
            //                [self.view addSubview:albumViews];
            //                albums = albumViews;
            //            }];
            //        }
            //            break;
            
        default:
            break;
            
    }}

- (void)logOut: (UIBarButtonItem*)sender
{
    MGALogin * loginPage = [[MGALogin alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:loginPage animated:YES];
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.toolbarHidden = YES;
}

- (void)goToLikesPage: (UIBarButtonItem *)sender
{
    NSLog(@"Likes Page");
}

- (void)goToGenresPage: (UIBarButtonItem *)sender
{
    MGAGenre * genrePage = [[MGAGenre alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:genrePage animated:YES];
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.toolbarHidden = YES;
}

- (void)goToDiscoveryPage: (UIBarButtonItem *)sender
{
    NSLog(@"Discovery Page");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
