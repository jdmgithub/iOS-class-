//
//  PPAFilterController.m
//  PullPick
//
//  Created by Jisha Obukwelu on 5/1/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//

#import "PPAFilterController.h"


@interface PPAFilterController ()
@property (nonatomic) NSString * currentFilter;

@end

@implementation PPAFilterController
{
   
    NSMutableArray * filterButtons;
    NSArray * filterNames;
    UIScrollView * scrollView;
    
    
    float wh;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        filterButtons = [@[] mutableCopy];
        filterNames = @[
                       @"CIColorCrossPolynomial",
                        @"CIColorInvert",
                        @"CIColorMonochrome",
                        @"CIColorPosterize",
                        @"CIFalseColor",
                        @"CIMaskToAlpha",
                        @"CIPhotoEffectChrome",
                        @"CIPhotoEffectFade",
                        @"CIPhotoEffectInstant",
                        @"CIPhotoEffectMono",
                        @"CIPhotoEffectNoir",
                        @"CIPhotoEffectProcess",
                        @"CIPhotoEffectTonal",
                        @"CIPhotoEffectTransfer",
                        @"CISepiaTone",
                        @"CIVignetteEffect"
                        ];
        
        scrollView = [[UIScrollView alloc]init];
        scrollView.backgroundColor =[UIColor blackColor];
        [self.view addSubview:scrollView];
    }
    return self;
}

- (void)viewWillLayoutSubviews
{
    wh = self.view.frame.size.height - 20;
    int spacing = 10;
    
    //button creation
    
    for (NSString * filterName in filterNames)
    {
        int i = (int)[filterNames indexOfObject:filterName];
        int x = (wh + spacing) * i + spacing;
        
        UIButton * filterButton = [[UIButton alloc] initWithFrame:CGRectMake(x, spacing, wh, wh)];
        
        filterButton.backgroundColor = [UIColor colorWithWhite:0.8f alpha:0.9f];
        
        filterButton.tag = i;
        
        [filterButton addTarget:self action:@selector(switchFilter:) forControlEvents:UIControlEventTouchUpInside];
        
        [filterButtons addObject:filterButton];
        
        [scrollView addSubview:filterButton];
    }
    
    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    scrollView.contentSize = CGSizeMake((wh + spacing)* [filterNames count] + spacing, self.view.frame.size.height);
}

- (UIImage *)filterImage:(UIImage *)image filterName:(NSString *)filterName
{
    CIImage * ciImage = [CIImage imageWithCGImage:image.CGImage];
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    [filter setValue:ciImage forKeyPath:kCIInputImageKey];
    
    CIContext * ciContext = [CIContext contextWithOptions:nil];
    
    CIImage * ciResult = [filter valueForKeyPath:kCIOutputImageKey];
    return [UIImage imageWithCGImage:[ciContext createCGImage:ciResult fromRect:[ciResult extent]]];

}

- (void)setImageToFilter:(UIImage *)imageToFilter
{
    _imageToFilter = imageToFilter;
    
    for (UIButton * filterButton in filterButtons)
    {
        NSString * filterName = [filterNames objectAtIndex:filterButton.tag];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, (unsigned long)NULL), ^{
            
            UIImage * smallImage = [self shrinkImage:imageToFilter maxWH:wh];
            UIImage * image = [self filterImage:smallImage filterName:filterName];
            
            dispatch_async(dispatch_get_main_queue(), ^(void){
            [filterButton setImage:image forState:UIControlStateNormal];
            filterButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
            });
        });
    }
}

- (UIImage *)shrinkImage:(UIImage *)image maxWH:(int)widthHeight
{
    CGSize size = CGSizeMake(widthHeight, widthHeight/image.size.width * image.size.height);
    if(image.size.height < image.size.width)
    {
        size = CGSizeMake(widthHeight/ image.size.height * image.size.width, widthHeight);
    }
    
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage * destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return destImage;
}


- (void)switchFilter:(UIButton *)filterButton
{
    self.currentFilter = [filterNames objectAtIndex:filterButton.tag];
    NSLog(@"%@", filterNames);
    
    UIImage * image = [self filterImage:self.imageToFilter filterName:self.currentFilter];
    
    [self.delegate updateCurrentImageWithFilteredImage:image];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
