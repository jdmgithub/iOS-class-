//
//  PPPFlipsideViewController.h
//  Program1
//
//  Created by Jisha Obukwelu on 4/19/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PPPFlipsideViewController;

@protocol PPPFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(PPPFlipsideViewController *)controller;
@end

@interface PPPFlipsideViewController : UIViewController

@property (weak, nonatomic) id <PPPFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
