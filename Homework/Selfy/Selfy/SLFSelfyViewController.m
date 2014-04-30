//
//  SYASelfyViewController.m
//  Selfy
//
//  Created by Jisha Obukwelu on 4/22/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "SYASelfyViewController.h"
#import <Parse/Parse.h>


@interface SYASelfyViewController () <UITextViewDelegate>

@end

@implementation SYASelfyViewController
{
    UIView * newForm;
    UITextView * caption;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        newForm = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 280, self.view.frame.size.height - 40)];
        [self.view addSubview:newForm];
        
        UIImageView * addImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 280)];
        addImage.backgroundColor = [UIColor grayColor];
        addImage.image = [UIImage  imageNamed:@"camera"];
        addImage.alpha = 0.4;
        [newForm addSubview:addImage];
        
        caption = [[UITextView alloc] initWithFrame:CGRectMake(0, 290, 280, 30)];
        caption.text = @"ADD CAPTION";
        caption.backgroundColor = [UIColor grayColor];
        caption.alpha = 0.4;
        caption.textAlignment = NSTextAlignmentCenter;
        caption.font = [UIFont fontWithName:@"HELVETICA" size:15];
        [newForm addSubview:caption];
        
        caption.delegate = self;
        caption.keyboardType = UIKeyboardTypeTwitter;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)];
        [self.view addGestureRecognizer:tap];
        
        UIButton * submitButton1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 330, 80, 80)];
        [submitButton1 setTitle:@"SUBMIT" forState:UIControlStateNormal];
        submitButton1.titleLabel.textColor = [UIColor whiteColor];
        submitButton1.layer.cornerRadius = 40;
        submitButton1.backgroundColor = [UIColor lightGrayColor];
        [submitButton1 addTarget:self action:@selector(submitPicture) forControlEvents:UIControlEventTouchUpInside];
        [newForm addSubview:submitButton1];
        
        UIButton * cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 330, 80, 80)];
        [cancelButton setTitle:@"CANCEL" forState:UIControlStateNormal];
        cancelButton.titleLabel.textColor = [UIColor whiteColor];
        cancelButton.layer.cornerRadius = 40;
        cancelButton.backgroundColor = [UIColor lightGrayColor];
        [cancelButton addTarget:self action:@selector(cancelImage) forControlEvents:UIControlEventTouchUpInside];
        [newForm addSubview:cancelButton];
        
        
    }
    return self;
}

- (void)tapScreen
{
    [caption resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = CGRectMake(20, 20, 280, self.view.frame.size.height - 40);
    }];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)submitPicture
{
    NSLog(@"Submit Picture");
    UIImage * images = [UIImage imageNamed:@"soccerBall"];
    NSData *imageData = UIImagePNGRepresentation(images);
    PFFile *imageFile = [PFFile fileWithName:@"soccerBall.png" data:imageData];
    
    PFObject *userPhoto = [PFObject objectWithClassName:@"UserPhoto"];
    userPhoto[@"soccerBall"] = @"A soccer ball!";
    userPhoto[@"soccerBall"] = imageFile;
    [userPhoto saveInBackground];

}

- (void)cancelImage
{
     NSLog(@"Cancel Image");
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
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = CGRectMake(20, 20 - KB_HEIGHT, 280, self.view.frame.size.height - 40);
    }];
}

@end
