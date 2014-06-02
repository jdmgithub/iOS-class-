//
//  BAAViewController.m
//  BuildApp
//
//  Created by Jisha Obukwelu on 5/7/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "BAAViewController.h"
#import "BAATwoViewController.h"
#import "BAAThirdViewController.m"

@interface BAAViewController ()

@end

@implementation BAAViewController
{
    BAATwoViewController * twoVC;
    BAAThirdViewController * threeVC;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        UIButton * callTwoVCButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, 100, 100)];
        callTwoVCButton.layer.cornerRadius = 50;
        callTwoVCButton.backgroundColor = [UIColor redColor];
        [callTwoVCButton addTarget:self action:@selector(callTwoVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:callTwoVCButton];
        
        UIButton * callThreeVCButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 50, 100, 100)];
        callThreeVCButton.layer.cornerRadius = 50;
        callThreeVCButton.backgroundColor = [UIColor redColor];
        [callThreeVCButton addTarget:self action:@selector(callThreeVC) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:callThreeVCButton];
       
    }
    return self;
}

- (void)callTwoVC
{
    twoVC = [[BAATwoViewController alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview:twoVC.view];
}

- (void)callThreeVC
{
    threeVC = [[BAAThirdViewController alloc] initWithNibName:nil bundle:nil];
    [self.view addSubview:threeVC.view];

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
