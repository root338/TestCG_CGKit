//
//  CGTestCycleViewController.m
//  TestCG_CGKit
//
//  Created by apple on 16/7/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestCycleViewController.h"

#import "CGCycleScrollView.h"
#import "CGCycleScrollViewCell.h"

#import "UIView+CGAddConstraints.h"

@interface CGTestCycleViewController ()<CGCycleScrollViewDataSource>

@property (nonatomic, strong) CGCycleScrollView *cycleScrollView;

@end

@implementation CGTestCycleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cycleScrollView    = [[CGCycleScrollView alloc] init];
    self.cycleScrollView.dataSource     = self;
    self.cycleScrollView.pagingEnabled  = YES;
    
    [self.view addSubview:self.cycleScrollView];
    [self.cycleScrollView cg_autoEdgesInsetsZeroToViewController:self];
}

#pragma mark - CGCycleScrollViewDataSource
- (NSInteger)numberCycleScrollView:(CGCycleScrollView *)cycleScrollView
{
    return 10;
}

- (__kindof CGCycleScrollViewCell *)cycleScrollView:(CGCycleScrollView *)cycleScrollView cellAtIndex:(NSInteger)index
{
    CGCycleScrollViewCell *cell = [[CGCycleScrollViewCell alloc] initWithFrame:cycleScrollView.bounds];
    UILabel *label = [[UILabel alloc] initWithFrame:cell.bounds];
    label.backgroundColor   = [UIColor orangeColor];
    label.text  = [@(index) stringValue];
    label.textAlignment = NSTextAlignmentCenter;
    [cell addSubview:label];
    return cell;
}

@end
