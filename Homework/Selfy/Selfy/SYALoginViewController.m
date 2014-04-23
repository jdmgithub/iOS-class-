//
//  SYAViewController.m
//  Selfy
//
//  Created by Jisha Obukwelu on 4/22/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "SYALoginViewController.h"
#import <Parse/Parse.h>

@interface SYALoginViewController () <UITextViewDelegate>
{
    UIView * logInPage;
    UITextView * username;
    UITextView * password;
    UIButton * signIn;
}

@end

@implementation SYALoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        logInPage = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 280, self.view.frame.size.height - 40)];
        [self.view addSubview:logInPage];

        username = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, 280, 40)];
        username.backgroundColor = [UIColor lightGrayColor];
        username.alpha = 0.7;
        username.text = @"USERNAME";
        username.textAlignment = NSTextAlignmentCenter;
        username.layer.cornerRadius = 6;
        username.font = [UIFont fontWithName:@"HELVETICA" size:15];
        [logInPage addSubview:username];
        
        username.delegate = self;
        
        password = [[UITextView alloc] initWithFrame:CGRectMake(0, 70, 280, 40)];
        password.backgroundColor = [UIColor lightGrayColor];
        password.alpha = 0.7;
        password.secureTextEntry = YES;
        password.layer.cornerRadius = 6;
        password.text = @"PASSWORD";
        password.textAlignment = NSTextAlignmentCenter;
        password.font = [UIFont fontWithName:@"HELVETICA" size:15];
        [logInPage addSubview:password];
        
        password.delegate = self;
        
        signIn = [[UIButton alloc] initWithFrame:CGRectMake(0, 120, 280, 40)];
        [signIn setTitle:@"SIGN IN" forState:UIControlStateNormal];
        signIn.titleLabel.textColor = [UIColor whiteColor];
        signIn.layer.cornerRadius = 6;
        signIn.backgroundColor = [UIColor blueColor];
        signIn.alpha = 0.5;
        [signIn addTarget:self action:@selector(logIn:) forControlEvents:UIControlEventTouchUpInside];
        [logInPage addSubview:signIn];
        
        username.keyboardType = UIKeyboardTypeTwitter;
        password.keyboardType = UIKeyboardTypeTwitter;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)];
        [self.view addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)tapScreen
{
    [username resignFirstResponder];
    [password resignFirstResponder];
    [UITextField animateWithDuration:0.2 animations:^{
        logInPage.frame = CGRectMake(20, 20, 280, self.view.frame.size.height - 40);
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)logIn: (UIButton *)signIn
{
    NSLog(@"Login to Parse");
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
    PFUser * user = [PFUser currentUser];
    
    user.username = @"jishaobukwelu";
    user.password = @"password";
    [user saveInBackground];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [UITextField animateWithDuration:0.2 animations:^{
        logInPage.frame = CGRectMake(20, 20 - KB_HEIGHT, 280, self.view.frame.size.height - 40);
    }];
}
@end

