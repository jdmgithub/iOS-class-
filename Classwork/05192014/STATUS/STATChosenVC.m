//
//  STATChosenVC.m
//  STATUS
//
//  Created by Jisha Obukwelu on 5/19/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "STATChosenVC.h"
#import "STATSmileySingle.h"
#import "STATYellowSmileyVC.h"

@interface STATChosenVC ()
@property (nonatomic) NSMutableArray * bigSmilies;
@property (nonatomic) BOOL twitterOn;
@property (nonatomic) BOOL fbOn;

@end

@implementation STATChosenVC
{
    UIView * chosenFrame;
    UIView * socialMediaView;
    
    UIButton * checkBox;
    UIButton * socialMedia;
    UIButton * bigSmileFrame;
    UIButton * backButton;
    UIButton * selectedMedia;
    
    NSArray * socialMedias;
    NSMutableArray * media;
    NSArray * bigSmiles;
    NSArray * selSocialMedias;
    
    STATYellowSmileyVC * smallSmiley;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        selectedMedia = [[UIButton alloc] initWithFrame:CGRectMake( 0, 0, 48, 48)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    bigSmiles = @[[UIImage imageNamed:@"yellow_1"],
                  [UIImage imageNamed:@"yellow_2"],
                  [UIImage imageNamed:@"yellow_3"],
                  [UIImage imageNamed:@"yellow_4"],
                  [UIImage imageNamed:@"yellow_5"],
                  [UIImage imageNamed:@"yellow_6"],
                  [UIImage imageNamed:@"yellow_7"],
                  [UIImage imageNamed:@"yellow_8"],
                  [UIImage imageNamed:@"yellow_9"],
                  ];
    
    
    int index = [STATSmileySingle singleton].bigSmiley;
    
    chosenFrame = [[UIView alloc]initWithFrame:CGRectMake (56, 180, 192, 192)];
    chosenFrame.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:chosenFrame];
    
    bigSmileFrame = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 192, 192)];
    [bigSmileFrame setImage:bigSmiles[index] forState:UIControlStateNormal];
    [bigSmileFrame addTarget:self action:@selector(figureOutSelector:) forControlEvents:UIControlEventTouchUpInside ];
    [chosenFrame addSubview:bigSmileFrame];
    [self.bigSmilies addObject:bigSmileFrame];
    
    socialMediaView = [[UIView alloc] initWithFrame:CGRectMake(99, 90, 116, 48)];
    socialMediaView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:socialMediaView];
    
    socialMedias = @[@"sm_twitter_g",
                     @"sm_facebook_g",
                     ];
    
    selSocialMedias = @[@"sm_twitter",
                       @"sm_facebook",
                       ];

    
    float mediaWidth = 48;
    
    for(int i = 0; i < 2; i++)
    {
        // index will = 0,1,2,3
        
        socialMedia= [[UIButton alloc] initWithFrame:CGRectMake((mediaWidth + 10) * i, 0, 48, 48)];
        [socialMedia setImage:[UIImage imageNamed:socialMedias[i]] forState:(UIControlStateNormal)];
        [socialMedia setImage:[UIImage imageNamed:selSocialMedias[i]] forState:(UIControlStateSelected)];
        socialMedia.tag = i;
        [socialMediaView addSubview:socialMedia];
        [socialMedia addTarget:self action:@selector(selectedState:) forControlEvents:UIControlEventTouchUpInside];
        [media addObject:socialMedia];
    }
    
    backButton = [[UIButton alloc] initWithFrame:CGRectMake(56, 415, 48, 56)];
    [backButton setImage:[UIImage imageNamed:@"arrow1"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    checkBox = [[UIButton alloc] initWithFrame:CGRectMake(200, 415, 48, 56)];
    [checkBox setImage:[UIImage imageNamed:@"check"] forState:UIControlStateNormal];
    [checkBox addTarget:self action:@selector(sendToSocialMedia:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkBox];
}

- (void)figureOutSelector: (UIButton *)sender
{
    [STATSmileySingle singleton].bigSmiley = (int)sender.tag;
}

- (void)selectedState: (UIButton *)sender
{
    [sender setSelected:!sender.selected];
    if(sender.tag == 0)
    {
        _twitterOn = !_twitterOn;
        
    } else if (sender.tag == 1)
    {
        _fbOn = !_fbOn;
    }
}

- (void)goBack
{
        [self.navigationController popViewControllerAnimated:YES];
}

- (void)sendToSocialMedia: (UIButton *)sender
{
    NSLog(@"Send To Social Media");
    NSLog(@"%u, %u", _twitterOn,_fbOn);
    
    if(_twitterOn)
    {
        NSLog(@"Twitter On");
    }
    else {
        NSLog(@"Twitter Off");
    }
    
    if(_fbOn)
    {
        NSLog(@"FB On");
    }
    else {
        NSLog(@"FB Off");
    }

    
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
