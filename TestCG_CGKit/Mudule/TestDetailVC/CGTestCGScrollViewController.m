//
//  CGTestCGScrollViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/8/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestCGScrollViewController.h"

#import "CGLineView.h"
#import "CGScrollView.h"
#import "MLPageControl.h"

#import "UIView+CGAddConstraints.h"

@interface CGTestCGScrollViewController ()
{
    UIScrollView    *_scrollView;
}

@end

@implementation CGTestCGScrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor   = [UIColor orangeColor];
    
    _scrollView = [[CGScrollView alloc] init];
    [self.view addSubview:_scrollView];
    
    [_scrollView cg_autoEdgesInsetsZeroToSuperview];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor    = [UIColor lightGrayColor];
    [_scrollView addSubview:view];
    
    [view cg_autoEdgesInsetsZeroToSuperview];
    [view cg_autoDimension:CGDimensionHeight fixedLength:FLT_MAX];
    [view cg_autoDimension:CGDimensionWidth equalView:_scrollView];
    
    [self showPageControl];
}

- (void)showPageControl
{
    MLPageControl *pageControl  = [[MLPageControl alloc] init];
    pageControl.style           = MLPageControlStyleFlow;
    pageControl.pageIndicatorTintColor          = [UIColor blackColor];
    pageControl.currentPageIndicatorTintColor   = [UIColor redColor];
    pageControl.numberOfPages   = 100;
    pageControl.currentPage     = 5;
    pageControl.pageSize        = CGSizeMake(40, 40);
    pageControl.frame = CGRectMake(0, 100, self.view.width, 50);
    [_scrollView addSubview:pageControl];
}

@end
