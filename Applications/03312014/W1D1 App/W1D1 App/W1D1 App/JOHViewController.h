//
//  JOHViewController.h
//  W1D1 App
//
//  Created by Jisha Obukwelu on 3/31/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JOHViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label1;
- (IBAction)button1:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *label2a;
@property (weak, nonatomic) IBOutlet UILabel*label2;
- (IBAction)button2:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *label3;
- (IBAction)button3:(id)sender;

@end
