//
//  GLACollectionVC.m
//  GridView
//
//  Created by Jisha Obukwelu on 5/30/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "GLACollectionVC.h"

@interface GLACollectionVC ()

@end

@implementation GLACollectionVC
{
    NSArray * movies;
}

- (id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    self  = [super initWithCollectionViewLayout:layout];
    if (self) {
        
         [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        self.collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        movies = @[
                   @"Congo",
                   @"Godzilla",
                   @"Weekend at Bernie's",
                   @"Big",
                   @"Babe",
                   @"Batman",
                   @"Pi"
                   ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [movies count];
}

- (CGSize)collectionView: (UICollectionViewCell *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH - 50)/3, (SCREEN_HEIGHT - 50)/4);
}

- (CGFloat) collectionView: (UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, cell.frame.size.width - 20, 30)];
    [cell.contentView addSubview:title];
    
    title.textColor = [UIColor darkGrayColor];
    title.text = movies[indexPath.row];
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
