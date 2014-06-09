//
//  MGASignUp.m
//  MusicGrid
//
//  Created by Jisha Obukwelu on 6/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "MGASignUp.h"
#import "MGASwipeView.h"
#import "MGANav.h"

@interface MGASignUp ()<UITextFieldDelegate>

@end

@implementation MGASignUp
{
    UIView * signUpForm;
    UIImageView * avatar;
    NSArray * fieldNames;
    NSMutableArray * fields;
    
    float signUpOrigY;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mobile_bkgrd_i5"]];

        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
        [self.view addGestureRecognizer:tap];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIBarButtonItem * cancelSignUp = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelSignUp)];
    
    cancelSignUp.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = cancelSignUp;
    
    signUpOrigY = (self.view.frame.size.height - 320)/2;
    
    fieldNames = @[
                   @"FIRST_NAME",
                   @"LAST_NAME",
                   @"USER NAME",
                   @"PASSWORD",
                   @"PASSWORD_CONFIRMATION",
                   @"EMAIL"];
    
    fields = [@[]mutableCopy];
    
    for(NSString * name in fieldNames)
    {
        // index will = 0,1,2,3,4,5
        
        NSInteger index = [fieldNames indexOfObject:name];
        
        UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(20, (index * 50)+ 100, 280, 40)];
        textField.backgroundColor = [UIColor lightGrayColor];
        textField.alpha = 0.7;
        textField.placeholder = name;
        textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.layer.cornerRadius = 4;
        textField.font = [UIFont fontWithName:@"MONTSERRAT" size:12];
        textField.autocorrectionType = UITextAutocapitalizationTypeNone;
        textField.autocapitalizationType = FALSE;
        textField.delegate = self;
        
        [fields addObject:textField];
        
        [self.view addSubview:textField];
    }
    ((UITextField *)fields [3]).secureTextEntry = YES;
    ((UITextField *)fields [4]).secureTextEntry = YES;
    
    UIButton * registerButton = [[UIButton alloc] initWithFrame:CGRectMake(20, ([fieldNames count] * 50)+100, 280, 40)];
    [registerButton setTitle:@"REGISTER" forState:UIControlStateNormal];
    registerButton.titleLabel.textColor = [UIColor whiteColor];
    registerButton.layer.cornerRadius = 4;
    registerButton.backgroundColor = [UIColor blackColor];
    registerButton.alpha = 0.8;
    [registerButton addTarget:self action:@selector(registerNewUser:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    NSLog(@"push registerButton%@", registerButton);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideKeyboard
{
    for (UITextField * textFieldItem in fields)
    { [textFieldItem resignFirstResponder];}
    
    [UITextField animateWithDuration:0.2 animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSInteger index = [fields indexOfObject:textField];
    NSInteger emptyIndex = [fields count];
    
    for (UITextField * textFieldItem in fields)
    {
        NSInteger fieldIndex = [fields indexOfObject:textField];
        if (emptyIndex == [fields count])
        {
            if ([textFieldItem.text isEqualToString:@""])
            {
                emptyIndex = fieldIndex;
            }
        }
    }
    NSLog(@"textFieldIndex: %d", (int)index);
    NSLog(@"emptyIndex: %d", (int)index);
    
    if(index <= emptyIndex) return YES;
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    int extraSlide = 0;
    
    // 416 h for 3.5"
    
    if(self.view.frame.size.height >500)// 504 h for 4"
    {
        extraSlide = 50;
        
    } else {// 416 h for 3.5"
        
        NSInteger index = [fields indexOfObject:textField];
        extraSlide = (int)index;
    }
    
    [UITextField animateWithDuration:0.2 animations:^{
        self.view.frame = CGRectMake(0, 0 - extraSlide, self.view.frame.size.width, self.view.frame.size.height);
    }];
}

- (void)cancelSignUp
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{}];
}


- (void)registerNewUser: (UIButton*)sender
{
    [self hideKeyboard];
    
    // Create the request.
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://shielded-forest-3008.herokuapp.com/api/users"]];
    
    // Specify that it will be a POST request
    request.HTTPMethod = @"POST";
    
    // This is how we set header fields
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSDictionary * dict = @{
                            @"user": @{
                                        @"first_name":((UITextField *)fields[0]).text,
                                        @"last_name": ((UITextField *)fields[1]).text,
                                        @"username" :((UITextField *)fields[2]).text,
                                        @"password" :((UITextField *)fields[3]).text,
                                        @"password_confirmation" : ((UITextField *)fields [4]).text,
                                        @"email": ((UITextField *)fields[5]).text,
                                    }
                            };
    
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    
    //object for key
    [request setHTTPBody:jsonData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       
        NSLog(@"%@", response);
        
        NSString * success = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
        NSLog(@"%@",success);
        
        UIView * showActivity = [[UIView alloc]initWithFrame:CGRectMake(50, signUpOrigY + 40, 100, 100)];
        [self.view addSubview:showActivity];
        
        UIActivityIndicatorView * activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityIndicator.color = [UIColor blackColor];
        activityIndicator.frame = showActivity.frame;
        
        [showActivity addSubview:activityIndicator];
        [activityIndicator startAnimating];
        
        // Setting a timeout
        request.timeoutInterval = 20.0;
 
        if([success isEqualToString:@"1"])
        {
            [activityIndicator stopAnimating];
            
            // Setting a timeout
            request.timeoutInterval = 20.0;
            
            MGASwipeView * swipeVC = [[MGASwipeView alloc]initWithNibName:nil bundle:nil];
            MGANav * nc = [[MGANav alloc] initWithRootViewController:swipeVC];
            nc.navigationBar.barTintColor = [UIColor blackColor];;
            nc.navigationBar.translucent = NO;
            [self.navigationController pushViewController:swipeVC animated:YES];
            
        }  else {
            
            [activityIndicator stopAnimating];
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                             message:@"Failed to authenticate"
                                                            delegate:self
                                                   cancelButtonTitle:@"Cancel"
                                                   otherButtonTitles:@"Retry", nil];
            [alert show];
        };

    }];
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
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

-(BOOL)prefersStatusBarHidden {return YES;}

@end
