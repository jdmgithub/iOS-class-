//
//  MGASwipe.m
//  MGASwipeView
//
//  Created by Jisha Obukwelu on 6/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "MGASwipe.h"
#import "MOVE.h"
#import "MGAPreferenceArrays.h"

@interface MGASwipeView ()


@end

@implementation MGASwipe
{
    BOOL swiped;
    UIView * albums;
    UIView * albumViews;
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
    
    albums = [[UIView alloc] initWithFrame:CGRectMake(50, 75, 200, 200)];
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
            
                albums.frame = CGRectMake(- 250, 75, 200, 200);
                
                [[MGAPreferenceArrays sharedArrays].likes addObject:albums];

            } completion:^(BOOL finished) {
                
                albumViews = [[UIView alloc]initWithFrame:CGRectMake(50, 75, 200, 200)];
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
                
                albums.frame = CGRectMake(50, -350, 200, 200);
                
                [[MGAPreferenceArrays sharedArrays].viewLater addObject:albums];

            } completion:^(BOOL finished) {
                
                albumViews = [[UIView alloc]initWithFrame:CGRectMake(50, 75, 200, 200)];
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
                
                albums.frame = CGRectMake(50, 500, 200, 200);
                
                [[MGAPreferenceArrays sharedArrays].dislikes addObject:albums];

            } completion:^(BOOL finished) {
                
                albumViews = [[UIView alloc]initWithFrame:CGRectMake(50, 75, 200, 200)];
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
//                albums.frame = CGRectMake(50, 500, 200, 200);
//                
//            } completion:^(BOOL finished) {
//                
//                albumViews = [[UIView alloc]initWithFrame:CGRectMake(50, 75, 200, 200)];
//                albumViews.backgroundColor = [UIColor blackColor];
//                [self.view addSubview:albumViews];
//                albums = albumViews;
//            }];
//        }
//            break;
            
        default:
            break;

    }}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
