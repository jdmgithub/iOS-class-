//
//  MGAGenre.m
//  MusicGrid
//
//  Created by Jisha Obukwelu on 6/8/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "MGAGenre.h"

@interface MGAGenre ()

@end

@implementation MGAGenre
{
    NSArray * genreNames;
    NSMutableArray * genre;
    UIButton * button;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    genreNames = @[
                   @"ROCK",
                   @"RAP",
                   @"COUNTRY",
                   @"CLASSIC ROCK",
                   @"ELECTRONIC",
                   @"POP",
                   @"ALTERNATIVE"
                
                   ];
    
    genre = [@[]mutableCopy];
    
    int brickCols = 3;
    int brickRows = 3;
    
    
    float brickWidth = 80;
    float brickHeight = 80  ;
    
    for (int c = 0; c < brickCols; c++)
    {
        for(int r = 0; r < brickRows; r++)
        {
            float brickX = ((brickWidth +10) *c) +10;
            float brickY = ((brickHeight + 10) *r) +10;
            button =[[UIButton alloc] initWithFrame:CGRectMake(brickX, brickY, brickWidth, brickHeight)];
            button.layer.cornerRadius = 6;
            button.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.7];
            
            [self.view addSubview:button];
            [genre addObject:button];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
