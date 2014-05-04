//
//  PPAViewController.m
//  PullPick
//
//  Created by Jisha Obukwelu on 4/30/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "PPAViewController.h"
#import "PPAFilterController.h"
#import "HSBColorControlVC.h"
#import "BlurViewController.h"
#import "ControlsViewController.h"

@interface PPAViewController ()  <UINavigationControllerDelegate, UIImagePickerControllerDelegate, ControlsViewControllerDelegate, PPAFilterControllerDelegate, HSBColorControlVCDelegate, BlurViewControllerDelegate>

@property (nonatomic) UIImage * originalImage;

@end

@implementation PPAViewController
{
    UIImageView * imageView;
    PPAFilterController * filterVC;
    HSBColorControlVC * colorControlVC;
    BlurViewController * blurVC;
    ControlsViewController * controlsVC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.2f alpha:0.9f];
    
    imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imageView];
    
    UIView * navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    navBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:navBar];
    
    UIButton * libraryButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    libraryButton.layer.cornerRadius = 15;
    libraryButton.backgroundColor = [UIColor colorWithWhite:0.3f alpha:0.9];
    [libraryButton addTarget:self action:@selector(selectImages:) forControlEvents:UIControlEventTouchUpInside];
    [navBar addSubview:libraryButton];
    
    
    controlsVC = [[ControlsViewController alloc] initWithNibName:nil bundle:nil];
    controlsVC.delegate = self;
    controlsVC.view.backgroundColor = [UIColor whiteColor];
    controlsVC.view.frame = CGRectMake(0, SCREEN_HEIGHT - 150, SCREEN_WIDTH, 50);
    [self.view addSubview:controlsVC.view];
    
    filterVC = [[PPAFilterController alloc] initWithNibName:nil bundle:nil];
    filterVC.delegate = self;
    filterVC.view.frame = CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, 100);
    
    colorControlVC = [[HSBColorControlVC alloc] initWithNibName:nil bundle:nil];
    colorControlVC.delegate = self;
    colorControlVC.view.frame = CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, 100);
    
    blurVC = [[BlurViewController alloc] initWithNibName:nil bundle:nil];
    blurVC.delegate = self;
    blurVC.view.frame = CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, 100);
}

- (void)setOriginalImage: (UIImage *)originalImage
{
    _originalImage = originalImage;
    filterVC.imageToFilter = originalImage;
    imageView.image = originalImage;
}

- (void)updateCurrentImageWithFilteredImage:(UIImage *)image;
{
    imageView.image = image;
    blurVC.imageToFilter = image;
    colorControlVC.currentImage = image;
    
}

- (void)selectFilter
{
    [blurVC.view removeFromSuperview];
    [colorControlVC.view removeFromSuperview];
    
    
    [self.view addSubview:filterVC.view];
}

- (void)selectHSB
{
    [filterVC.view removeFromSuperview];
    [blurVC.view removeFromSuperview];

    
    [self.view addSubview: colorControlVC.view];
}

- (void)selectBlur
{
    [colorControlVC.view removeFromSuperview];
    [filterVC.view removeFromSuperview];
    
    
    [self.view addSubview: blurVC.view];
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
    self.originalImage = info[UIImagePickerControllerOriginalImage];
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
