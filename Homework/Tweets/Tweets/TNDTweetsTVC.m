//
//  TNDTweetsTVC.m
//  Tweets
//
//  Created by Jisha Obukwelu on 4/13/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "TNDTweetsTVC.h"
#import "TNDTweetCell.h"

@interface TNDTweetsTVC ()

@end

@implementation TNDTweetsTVC
{
    NSMutableArray * tweetLists;
    UITextField * infoField;
    UIButton * submitButton;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,80)];
        self.tableView.rowHeight = 60;
        self.tableView.layer.cornerRadius = 3;
        
        self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
        
        tweetLists = [@[
                   
            @{@"created_at": @"Sat Apr 12 03:35:47 +0000 2014",
            @"id": @454825180305817600,
            @"id_str": @"454825180305817600",
            @"text": @"@foxjon123 What an awesome #FirstTweet ! So excited that you are doing things outside of what is being taught @TheIronYard #YouRock",
            @"source": @"<a href=\"http://itunes.apple.com/us/app/twitter/id409789998?mt=12\" rel=\"nofollow\">Twitter for Mac</a>",
            @"truncated": @NO,
            @"in_reply_to_status_id": @454805152306696200,
            @"in_reply_to_status_id_str": @"454805152306696193",
            @"in_reply_to_user_id": @2435447227,
            @"in_reply_to_user_id_str": @"2435447227",
            @"in_reply_to_screen_name": @"foxjon123",
            @"user":  @{
                @"id": @18487945,
                @"id_str": @"18487945",
                @"name": @"Jo Albright",
                @"screen_name": @"Joalbright",
                @"location": @"",
                @"description": @"Co-Founder & iOS Developer for HighFive | iOS Instructor @TheIronYard",
                @"url": @"http://t.co/0j8pzmKFox",
                @"entities":  @{
                    @"url":  @{
                        @"urls":  @[
                                  @{
                                      @"url": @"http://t.co/0j8pzmKFox",
                                      @"expanded_url": @"http://jo2.co",
                                      @"display_url": @"jo2.co",
                                      @"indices":  @[
                                                   @0,
                                                   @22
                                                   ],
                                  }
                                  ]
                    },
                    }
                }
              }
            ]
                 mutableCopy];
//                    @"description":  @{
//                        @"urls":  @[]
//                    }
//                },
//                @"protected": @false,
//                @"followers_count": @207,
//                @"friends_count": @313,
//                @"listed_count": @12,
//                @"created_at": @"Tue Dec 30 20:46:32 +0000 2008",
//                @"favourites_count": @26,
//                @"utc_offset": @14400,
//                @"time_zone": @"Eastern Time (US & Canada)",
//                @"geo_enabled": @true,
//                @"verified": @false,
//                @"statuses_count": @201,
//                @"lang": @"en",
//                @"contributors_enabled": @false,
//                @"is_translator": @false,
//                @"is_translation_enabled": @false,
//                @"profile_background_color": @"FFFFFF",
//                @"profile_background_image_url": @"http://pbs.twimg.com/profile_background_images/267632372/logo.jpg",
//                @"profile_background_image_url_https": @"https://pbs.twimg.com/profile_background_images/267632372/logo.jpg",
//                @"profile_background_tile":
//                    @
//                    false,
//                @"profile_image_url": @"http://pbs.twimg.com/profile_images/420687815211364352/wF9mtzLq_normal.jpeg",
//                @"profile_image_url_https": @"https://pbs.twimg.com/profile_images/420687815211364352/wF9mtzLq_normal.jpeg",
//                @"profile_banner_url": @"https://pbs.twimg.com/profile_banners/18487945/1391875911",
//                @"profile_link_color": @"00E0E0",
//                @"profile_sidebar_border_color": @"FFFFFF",
//                @"profile_sidebar_fill_color": @"F7F7F7",
//                @"profile_text_color": @"424242",
//                @"profile_use_background_image": @true,
//                @"default_profile": @false,
//                @"default_profile_image": @false,
//                @"following": @false,
//                @"follow_request_sent": @false,
//                @"notifications": @false
//            },
//            @"geo": null,
//            @"coordinates": null,
//            @"place": null,
//            @"contributors": null,
//            @"retweet_count": @0,
//            @"favorite_count": @0,
//            @"entities":  @{
//                @"hashtags":  @[
//                              @{
//                                 @"text": @"FirstTweet",
//                                  @"indices":  @[
//                                               @27,
//                                               @38
//                                               ]
//                              },
//                              {
//                                  @"text": @"YouRock",
//                                  @"indices":  [
//                                               @123,
//                                               @131
//                                               ]
//                              }
//                              ],
//                @"symbols":  @[],
//                @"urls":  @[],
//                @"user_mentions":  @[
//                                   @{
//                                       @"screen_name": @"foxjon123",
//                                       @"name": @"Jon Fox",
//                                       @"id": @2435447227,
//                                       @"id_str": @"2435447227",
//                                       @"indices":  @[
//                                                    @0,
//                                                    @10
//                                                    ]
//                                   },
//                                   @{
//                                       @"screen_name": @"TheIronYard",
//                                       @"name": @"The Iron Yard",
//                                       @"id": @576311383,
//                                       @"id_str": @"576311383",
//                                       @"indices":  @[
//                                                    @110,
//                                                    @122
//                                                    ]
//                                   }
//                                   ]
//            },
//            @"favorited": false,
//            @"retweeted": false,
//            @"lang": @"en"
//             },];
        
       
        
        //        [self loadListItems];
        
        infoField = [[UITextField alloc] initWithFrame:CGRectMake(10,20,160,50)];
        infoField.placeholder = @"TWEETS";
        infoField.backgroundColor = [UIColor lightGrayColor];
        infoField.alpha = 0.5;
        infoField.layer.cornerRadius = 6;
        infoField.textAlignment = NSTextAlignmentCenter;
        infoField.font = [UIFont fontWithName:@"Times New Roman" size:(20)];
        
        infoField.delegate = self;
        
        [self.tableView.tableHeaderView addSubview:infoField];
        
        submitButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 20, 100, 50)];
        submitButton.backgroundColor = [UIColor lightGrayColor];
        submitButton.layer.cornerRadius = 6;
        [submitButton setTitle:@"New Tweet" forState:UIControlStateNormal];
        [submitButton addTarget:(self) action:@selector (addTweet:) forControlEvents:UIControlEventTouchUpInside];
        [self.tableView.tableHeaderView addSubview:submitButton];

        submitButton.titleLabel.font =[UIFont fontWithName:@"Times New Roman" size:(14)];
        submitButton.titleLabel.textColor =[UIColor darkGrayColor];
    }
        return self;
    
}
    


-(void)addTweet:(id)sender
//logs what happens when you type in field and touch a specific button
{
//        UIButton * button = (UIButton *)sender;
//        NSString * name = infoField.text;
    
        NSLog(@"%@", sender);
            
        //after clicking a button keyboard goes away
    
        [infoField resignFirstResponder];
            
        [self.tableView reloadData];
            
        [self saveData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//creates new cells as new users are inputted

{
    return [tweetLists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TNDTweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell==nil)
    {
        cell =[[TNDTweetCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    NSDictionary * tweetList = tweetLists[indexPath.row];
    

    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSDictionary * tweet = [self getTweets:indexPath.row];
//    
//    [tweets removeObjectIdenticalTo:tweet];
//    
//    TNDTweetCell *cell = (TNDTweetCell *)[tableView cellForRowAtIndexPath:indexPath];
//    cell.alpha = 0;
//    
//    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    
//    [self saveData];
//}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

- (void)saveData
//saves data
{
    NSString *path = [self listArchivePath];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:tweetLists];
    [data writeToFile:path options:NSDataWritingAtomic error:nil];
}

- (NSString *)listArchivePath
//sets directory
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentDirectory = documentDirectories[0];
    return [documentDirectory stringByAppendingPathComponent:@"listdata.data"];
}

- (void)loadListItems
//what happens when your to do list is loaded
{
    NSString *path = [self listArchivePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        tweetLists = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
//return key makes keyboard go away
{
    NSLog(@"Returned");
    
    [textField resignFirstResponder];
    
    return YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
