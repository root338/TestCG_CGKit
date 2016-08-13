//
//  CGTestCGScrollViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/8/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestCGScrollViewController.h"

#import "CGScrollView.h"

#import "UIView+CGAddConstraints.h"

@interface CGTestCGScrollViewController ()
{
    CGScrollView    *_scrollView;
}

@end

@implementation CGTestCGScrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _scrollView = [[CGScrollView alloc] init];
    [self.view addSubview:_scrollView];
    
    [_scrollView cg_autoEdgesInsetsZeroToViewController:self];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor    = [UIColor lightGrayColor];
    [_scrollView addSubview:view];
    
    [view cg_autoEdgesInsetsZeroToSuperview];
    [view cg_autoDimension:CGDimensionHeight fixedLength:1000];
    [view cg_autoDimension:CGDimensionWidth equalView:_scrollView];
    
    self.automaticallyAdjustsScrollViewInsets   = NO;
}

@end
