//
//  PPAViewController.m
//  PullPick
//
//  Created by Jisha Obukwelu on 4/30/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "PPAViewController.h"

@interface PPAViewController ()  <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation PPAViewController
{
    UIImageView * imageView;
    UIScrollView * scrollView;
    UIPageControl * pageControl;
    UITapGestureRecognizer * tap;
    UIButton * button;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imageView];
    
    UIView * navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    navBar.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:navBar];
    
    int spacing = 10;
    
    UIButton * libraryButton = [[UIButton alloc] initWithFrame:CGRectMake(spacing, spacing, 30, 30)];
    libraryButton.layer.cornerRadius = 15;
    libraryButton.backgroundColor = [UIColor redColor];
    [libraryButton addTarget:self action:@selector(selectImages:) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:libraryButton];
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT - 100,SCREEN_WIDTH, 100)];
//    scrollView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    scrollView.backgroundColor =[UIColor lightGrayColor];
    
    int squares = 20;
    for(int i = 0; i < squares; i++)
    {
        int buttonSize = 80;
        int x = ((spacing + buttonSize) * i) + spacing;
        button = [[UIButton alloc] initWithFrame:CGRectMake(x, spacing, buttonSize, buttonSize)];
        button.backgroundColor = [UIColor redColor];
        [scrollView addSubview:button];
    }
    
    scrollView.contentSize = CGSizeMake((button.frame.size.width + spacing)* squares + spacing, 100);
    [self.view addSubview:scrollView];
}

- (void)selectImages:(UIButton *)sender
{
    UIImagePickerController * photoLibrary = [[UIImagePickerController alloc]init];
    photoLibrary.delegate = self;
    photoLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    photoLibrary.allowsEditing = YES;
    
    [self presentViewController:photoLibrary animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@", info);
    imageView.image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
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


@end
