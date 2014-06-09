//
//  MGALogin.m
//  MusicGrid
//
//  Created by Jisha Obukwelu on 6/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "MGALogin.h"
#import "MGASwipeView.h"
#import "MGASignUp.h"
#import "MGANav.h"
#import <FacebookSDK/FacebookSDK.h>
#import "MGASingleton.h"


@interface MGALogin () <UITextFieldDelegate,  FBLoginViewDelegate>

@property (strong, nonatomic) FBProfilePictureView *profilePictureView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *statusLabel;
@end

@implementation MGALogin
{
    UIView * logInPage;
     
    NSArray * fieldNames;
    NSMutableArray * fields;
     
    UIButton * signIn;
    UIButton * signUp;
     
    UITextField * textField;
     
     MGASwipeView * swipeView;
    
    float logInOrigY;
     
     NSString * userImageURL;
     
     bool loggedIn;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
     
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mobile_bkgrd_i5"]];
         
        logInOrigY = (self.view.frame.size.height - 300)/2;
        
        logInPage = [[UIView alloc] initWithFrame:CGRectMake(20, logInOrigY, 280, 400)];
        [self.view addSubview:logInPage];
        
        
        fieldNames = @[
                       @"USERNAME",
                       @"PASSWORD",
                       ];
        
        fields = [@[]mutableCopy];
        
        for(NSString * name in fieldNames)
        {
            // index will = 0,1,2,3,4,5
            
            NSInteger index = [fieldNames indexOfObject:name];
            
            textField = [[UITextField alloc] initWithFrame:CGRectMake(0, (index * 50) +100, 280, 40)];
            textField.backgroundColor = [UIColor lightGrayColor];
            textField.alpha = 0.7;
            textField.placeholder = name;
            textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
            textField.leftViewMode = UITextFieldViewModeAlways;
            textField.layer.cornerRadius = 4;
            textField.font = [UIFont fontWithName:@"HELVETICA" size:15];
            textField.autocorrectionType = UITextAutocapitalizationTypeNone;
            textField.autocapitalizationType = FALSE;
            textField.delegate = self;
            
            [fields addObject:textField];
            
            [logInPage addSubview:textField];
        }
        ((UITextField *)fields [1]).secureTextEntry = YES;

        
        
        signIn = [[UIButton alloc] initWithFrame:CGRectMake(0, ([fieldNames count] * 50) +100, 280, 40)];
        [signIn setTitle:@"SIGN IN" forState:UIControlStateNormal];
        signIn.titleLabel.textColor = [UIColor whiteColor];
        signIn.layer.cornerRadius = 6;
        signIn.backgroundColor = [UIColor blackColor];
        signIn.alpha = 0.8;
        [signIn addTarget:self action:@selector(logIn:) forControlEvents:UIControlEventTouchUpInside];
        [logInPage addSubview:signIn];
                
        signUp = [[UIButton alloc] initWithFrame:CGRectMake(0, 250, 280, 40)];
        [signUp setTitle:@"SIGN UP" forState:UIControlStateNormal];
        signUp.titleLabel.textColor = [UIColor whiteColor];
        signUp.layer.cornerRadius = 6;
        signUp.backgroundColor = [UIColor blackColor];;
        signUp.alpha = 0.8;
        [signUp addTarget:self action:@selector(showSignUp) forControlEvents:UIControlEventTouchUpInside];
        [logInPage addSubview:signUp];
        
        
        textField.keyboardType = UIKeyboardAppearanceDefault;
//        passwordField.keyboardType = UIKeyboardAppearanceDefault;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)];
        [self.view addGestureRecognizer:tap];
         
         FBLoginView * loginView = [[FBLoginView alloc] initWithReadPermissions:
                                    @[@"public_profile", @"email", @"user_friends"]];
         
         loginView.frame = CGRectMake(0, 300, 280, 40);
         loginView.delegate = self;
          loginView.layer.cornerRadius = 6;
         [logInPage addSubview:loginView];
    }
    return self;
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
     self.profilePictureView.profileID = user[@"id"];
     self.nameLabel.text = user.name;
     
     [MGASingleton sharedData].userName = user.name;
     
     [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *FBuser, NSError *error) {
          if (error == nil) {
               
               //NSString * username = [FBuser name];
               userImageURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", user[@"id"]];
               
               NSLog(@"user id TEST %@", user[@"id"]);
               NSLog(@"imageURL TEST %@", userImageURL);
          }
     }];
     [MGASingleton sharedData].avString = userImageURL;
     
     NSLog(@"username TEST1:  %@", [MGASingleton sharedData].userName);
     NSLog(@"useravatar TEST2: %@", [MGASingleton sharedData].avString);
}
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
   loggedIn = YES;
   [MGASingleton sharedData].avString = userImageURL;
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
     self.profilePictureView.profileID = nil;
     self.nameLabel.text = @"";
}

- (void)tapScreen
{
    [textField resignFirstResponder];
    [UITextField animateWithDuration:0.2 animations:^{
        logInPage.frame = CGRectMake(20, logInOrigY, 280, 190);
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)logIn: (UIButton *)sender
{
     if (loggedIn ==YES)
     {
          self.navigationController.navigationBarHidden = NO;
          self.navigationController.toolbarHidden = NO;
          self.navigationController.viewControllers = @[[[MGASwipeView alloc]initWithNibName:nil bundle:nil]];
    }
           // Create the request.
             NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://shielded-forest-3008.herokuapp.com/api/login"]];
             
             // Specify that it will be a GET request
             request.HTTPMethod = @"POST";
             
             // This is how we set header fields
             [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
             
             NSDictionary * confirm = @{
                                    @"username" :((UITextField *)fields[0]).text,
                                    @"password" :((UITextField *)fields[1]).text,
                                    };
             
             NSData * jsonData = [NSJSONSerialization dataWithJSONObject:confirm options:0 error:nil];
             
             //object for key
             [request setHTTPBody:jsonData];
             
             [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                  
                  NSLog(@"%@", response);
                  
                  NSString * success = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                  
                  NSLog(@"%@",success);
                  
                  UIView * showActivity = [[UIView alloc]initWithFrame:CGRectMake(50, logInOrigY + 40, 100, 100)];
                  [self.view addSubview:showActivity];
                  
                  UIActivityIndicatorView * activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
                  activityIndicator.color = [UIColor blackColor];
                  activityIndicator.frame = showActivity.frame;
                  
                  [showActivity addSubview:activityIndicator];
                  [activityIndicator startAnimating];
                  
                  // Setting a timeout
                  request.timeoutInterval = 20.0;
             }];}

//                  if([success isEqualToString:@"navtive_access_token"])
//                  {
//                    NSLog(@"Login Success");
//                       {
//                            [activityIndicator stopAnimating];
//                            
//                            // Setting a timeout
//                            request.timeoutInterval = 20.0;
//                            
//                            MGASwipeView * swipeVC = [[MGASwipeView alloc]initWithNibName:nil bundle:nil];
//                            MGANav * nc = [[MGANav alloc] initWithRootViewController:swipeVC];
//                            nc.navigationBar.barTintColor = [UIColor blackColor];;
//                            nc.navigationBar.translucent = NO;
//                            [self.navigationController presentViewController:nc animated:YES completion:^{}];}
//                       
//                  }else {
//                            [activityIndicator stopAnimating];
//                            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                                             message:@"Failed to authenticate"
//                                                                            delegate:self
//                                                                   cancelButtonTitle:@"Cancel"
//                                                                   otherButtonTitles:@"Retry", nil];
//                            [alert show];
//                       };
//                       
//                  }];
//             }

- (NSString *)urlEncodeValue:(NSString *)str
{
    NSString *result = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR("?=&+"), kCFStringEncodingUTF8));
    return result;
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_downloadedData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}

- (void)showSignUp
{
    MGASignUp * signUpVC = [[MGASignUp alloc] initWithNibName:nil bundle:nil];
    MGANav * nc = [[MGANav alloc] initWithRootViewController:signUpVC];
    nc.navigationBar.barTintColor = [UIColor blackColor];;
    nc.navigationBar.translucent = NO;
    [self.navigationController presentViewController:nc animated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UITextField animateWithDuration:0.2 animations:^{
        logInPage.frame = CGRectMake(20, logInOrigY - 50, 280, 190);
    }];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
