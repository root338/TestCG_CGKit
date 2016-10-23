//
//  CGTestTitleRadioViewController.m
//  TestCG_CGKit
//
//  Created by apple on 16/10/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestTitleRadioViewController.h"

#import "CGTitleRadioView.h"
#import "CGRadioViewAppearance.h"
#import "CGTitleRadioCellAppearance.h"

#import "UIView+CGAddConstraints.h"

@interface CGTestTitleRadioViewController ()

@end

@implementation CGTestTitleRadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGMutableRadioViewAppearance *appearance   = [[CGMutableRadioViewAppearance alloc] init];
    appearance.scrollDirection          = UICollectionViewScrollDirectionVertical;
    appearance.itemSize                 = CGSizeMake(self.view.width, 44);
    appearance.minimumLineSpacing       = 0;
    appearance.isAutoItemSize           = NO;
    appearance.backgroundColor          = [UIColor lightGrayColor];
    appearance.sliderViewHeight         = 1;
    appearance.sliderViewBorderColor    = [UIColor orangeColor];
    appearance.isHideSliderView         = YES;
    
    CGMutableTitleRadioCellAppearance *cellAppearance   = [[CGMutableTitleRadioCellAppearance alloc] init];
    cellAppearance.itemBackgroundColor  = [UIColor whiteColor];
    cellAppearance.itemSelectedBackgroundColor  = [UIColor lightGrayColor];
    cellAppearance.itemMarginEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 15);
    appearance.titleRadioCellAppearance = cellAppearance;
    
    NSMutableArray<NSString *> *titles  = [NSMutableArray arrayWithCapacity:50];
    for (NSInteger i = 0; i < 50; i++) {
        [titles addObject:[NSString stringWithFormat:@"title index %li", i]];
    }
    CGTitleRadioView *titleRadioView    = [[CGTitleRadioView alloc] initWithTitles:titles appearance:appearance];
    titleRadioView.disableCurrentSelectedIndexToCenterHorizontalPosition    = YES;
    [self.view addSubview:titleRadioView];
    [titleRadioView cg_autoEdgesInsetsZeroToSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
