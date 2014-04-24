//
//  TLANavController.m
//  TweetLike
//
//  Created by Jisha Obukwelu on 4/23/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TLANavController.h"
#import "TLATableViewCell.h"
#import "TLATableViewController.h"

@interface TLANavController () <UITextViewDelegate>

@end

@implementation TLANavController
{
    
    UIButton * addNew;
    UIView * bluebox;
    UIView * newTweetLayout;
    UIImageView * logo;
    UIButton * submitTweetButton;
    UIButton * cancelTweetButton;
    UITextView * writeTweetField;
    TLATableViewController * tweetController;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if(self)
    {
        //custom initialization
        self.navigationBar.barTintColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0f];
        
        bluebox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
        bluebox.backgroundColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0f];
        [self.view addSubview:bluebox];

        addNew = [[UIButton alloc] initWithFrame:CGRectMake(80,(self.navigationBar.frame.size.height - 30)/2, 160, 30)];
        addNew.backgroundColor = [UIColor whiteColor];
        addNew.layer.cornerRadius = 15;
        [addNew setTitle:@"Add New" forState:UIControlStateNormal];
        [addNew setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [addNew addTarget:(self) action:@selector (addNewTweet:) forControlEvents:UIControlEventTouchUpInside];
        [bluebox addSubview:addNew];
        
        addNew.titleLabel.textAlignment = NSTextAlignmentCenter;
        addNew.titleLabel.textColor =[UIColor blueColor];
        
        
        newTweetLayout = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 320, 430)];
        newTweetLayout.backgroundColor = [UIColor clearColor];
       // [bluebox addSubview:newTweetLayout];
        
        logo = [[UIImageView alloc] initWithFrame:CGRectMake((320 - 175)/2, 40, 175, 45)];
        logo.image = [UIImage imageNamed:@"logo"];
        [newTweetLayout addSubview:logo];
        
        writeTweetField = [[UITextView alloc] initWithFrame:CGRectMake(30, 100, 260, 200)];
        writeTweetField.backgroundColor = [UIColor whiteColor];
        writeTweetField.delegate = self;
        [newTweetLayout addSubview:writeTweetField];
        
        submitTweetButton = [[UIButton alloc] initWithFrame:CGRectMake(70, 310, 80, 40)];
        submitTweetButton.backgroundColor = [UIColor greenColor];
        submitTweetButton.layer.cornerRadius = 10;
        [submitTweetButton setTitle:@"SUBMIT" forState:UIControlStateNormal];
        submitTweetButton.titleLabel.textColor = [UIColor whiteColor];
        [submitTweetButton addTarget:(self) action:@selector (submitTweet:) forControlEvents:UIControlEventTouchUpInside];
        [newTweetLayout addSubview:submitTweetButton];
        
        cancelTweetButton = [[UIButton alloc] initWithFrame:CGRectMake(180, 310, 80, 40)];
        cancelTweetButton.backgroundColor = [UIColor redColor];
        cancelTweetButton.layer.cornerRadius = 10;
        [cancelTweetButton setTitle:@"CANCEL" forState:UIControlStateNormal];
        cancelTweetButton.titleLabel.textColor = [UIColor whiteColor];
        [cancelTweetButton addTarget:(self) action:@selector (cancelTweet:) forControlEvents:UIControlEventTouchUpInside];
        [newTweetLayout addSubview:cancelTweetButton];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)];
        [self.view addGestureRecognizer:tap];
    }
    return self;
}

- (void)addNewTweet: (UIButton *)sender
{
    NSLog(@"Add New Tweet");
    [UIView animateWithDuration:0.4 animations:^{
        bluebox.frame  = self.view.frame;
        addNew.alpha = 0.0;
    } completion:^(BOOL finished) {
        [bluebox addSubview:newTweetLayout];
    }];
}

- (void)submitTweet:(UIButton * )sender
{
    NSLog(@"%@", writeTweetField);
    
}

- (void)cancelTweet:(UIButton * )sender
{
    NSLog(@"Cancel");
    [UIView animateWithDuration:0.4 animations:^{
       [newTweetLayout removeFromSuperview];
       bluebox.frame = self.navigationBar.frame;
    } completion:^(BOOL finished) {
        [super viewDidLoad];
         addNew.alpha = 1.0;
    }];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [UITextView animateWithDuration:0.2 animations:^{
        newTweetLayout.frame = CGRectMake(0, 10 - 90, 320, 430);
    }];
}

- (BOOL) textView: (UITextView*) textView shouldChangeTextInRange: (NSRange) range
  replacementText: (NSString*) text
{
    if ([text isEqualToString:@"\n"]) {
        [writeTweetField resignFirstResponder];
        return NO;
    }
    return YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [UITextField animateWithDuration:0.2 animations:^{
        newTweetLayout.frame = CGRectMake(0, 10, 320, 430);
    }];
}

- (void)tapScreen
{
    [writeTweetField resignFirstResponder];
    [UITextField animateWithDuration:0.2 animations:^{
        newTweetLayout.frame = CGRectMake(0, 10, 320, 430);
    }];
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

@end
