//
//  PPPViewController.m
//  Program1
//
//  Created by Jisha Obukwelu on 4/19/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "PPPViewController.h"

@interface PPPViewController ()

@end

@implementation PPPViewController
{
    UILabel * writingLabel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        writingLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 400)];
        writingLabel.font = [UIFont fontWithName:(@"Times New Roman") size:(12)];
        [writingLabel  setText:@"PROGRAMMING IS FUN! \n And programming in Objective-C is even more FUN!"];
        writingLabel.numberOfLines = 2;
        writingLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
        [self.view addSubview:writingLabel];
         NSLog(@"Programming is fun");
         NSLog(@"And programming in Objective-C is even more fun");
        
        int sum;
        sum = 50 + 25;
        NSLog(@"The sum of 50 and 25 is %i", sum);
        
        
        int area;
        int perimeter;
        
        area = 6 * 6;
        perimeter = 6 + 6 + 6 + 6;
        
        NSLog(@"The area of the square is  %i", area);
        
        NSLog(@"The perimeter of the square is %i", perimeter);
    
        NSLog(@"In Objective-C, lowercase letters are sigificant. \n main is where program execution begins. \n Open and closed braces enclose program statements in a routine. \n All program statements  must be terminated by a semicolon.");
        
        int i;
        i = 1;
        NSLog(@"Testing ...");
        NSLog(@"    %i", i);
        NSLog(@"    %i", i + 1);
        NSLog(@"    %i", i + 2);
        
        int difference;
        difference = 87 - 15;
        NSLog(@"The difference between 87 and 15 is %i", difference);
        
        int sum2;
        sum2 = 25 + 37 - 19;
        NSLog(@"The answer to 25 + 37 - 19 is %i", sum2);
        
        int answer;
        int result;
        
        answer = 100;
        result = answer - 10;
        
        NSLog(@"The result is %i \n",result + 5);
        
        



    }
    return self;
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
