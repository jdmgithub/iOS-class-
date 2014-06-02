//
//  ControlsViewController.m
//  
//
//  Created by Savitha Reddy on 5/2/14.
//
//

#import "ControlsViewController.h"


@interface ControlsViewController ()

@end

@implementation ControlsViewController
{
    UIButton *filtersButton;
    UIButton *hsbButton;
    UIButton *blurButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewWillLayoutSubviews
{
    [super viewDidLoad];
    
    filtersButton = [[UIButton alloc] initWithFrame:CGRectMake(25,10,SCREEN_WIDTH/6,30)];
    filtersButton.backgroundColor = [UIColor whiteColor];
    [filtersButton setImage:[UIImage imageNamed:@"filter"] forState:(UIControlStateNormal)];
    [filtersButton addTarget:self.delegate action:@selector(selectFilter) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: filtersButton];
    
    hsbButton = [[UIButton alloc] initWithFrame:CGRectMake(125,5,SCREEN_WIDTH/6,30)];
    hsbButton.backgroundColor = [UIColor whiteColor];
    [hsbButton setImage:[UIImage imageNamed:@"HSB"] forState:(UIControlStateNormal)];
    [hsbButton addTarget:self.delegate action:@selector(selectHSB) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: hsbButton];
    
    blurButton = [[UIButton alloc] initWithFrame:CGRectMake(225,5,SCREEN_WIDTH/6,30)];
    blurButton.backgroundColor = [UIColor whiteColor];
    [blurButton setImage:[UIImage imageNamed:@"blur"] forState:(UIControlStateNormal)];
    [blurButton addTarget:self.delegate action:@selector(selectBlur) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: blurButton];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end




