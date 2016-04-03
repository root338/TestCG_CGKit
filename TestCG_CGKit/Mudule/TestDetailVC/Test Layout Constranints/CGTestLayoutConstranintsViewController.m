//
//  CGTestLayoutConstranintsViewController.m
//  TestCG_CGKit
//
//  Created by apple on 16/4/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestLayoutConstranintsViewController.h"

#import "UIView+CGCreateViews.h"
#import "UIView+CGAddConstraints.h"
#import "UIEdgeInsets+Category.h"

@interface CGTestLayoutConstranintsViewController ()
{
    UIView *viewFromViewController;
}
@end

@implementation CGTestLayoutConstranintsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self testDoubleViewToViewController];
    
    self.view.backgroundColor   = [UIColor whiteColor];
}

/** 测试单个视图添加到 UIViewController 上 */
- (void)testSingleToViewController
{
    NSLog(@"测试 UIView(CGViewControllerConstraints) cg_autoEdgesToViewController: withInsets: 方法");
    UIView *view = [UIView cg_createViewWithBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:view];
    [view cg_autoEdgesToViewController:self withInsets:UIEdgeInsetsMakeAllEqualValue(15)];
}

/** 多视图综合测试 */
- (void)testDoubleViewToViewController
{
//    NSLog(@"测试 UIView(CGViewControllerConstraints) cg_autoEdgesToViewController: withInsets: exculdingEdge: 方法");
    CGFloat space           = 15;
    UIEdgeInsets edgeInsets = UIEdgeInsetsMakeAllEqualValue(space);
    viewFromViewController  = [UIView cg_createViewWithBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:viewFromViewController];
    viewFromViewController.translatesAutoresizingMaskIntoConstraints    = NO;
    
    UIView *paramView = [UIView cg_createViewWithBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:paramView];
    paramView.translatesAutoresizingMaskIntoConstraints  = NO;
    
    [viewFromViewController cg_autoEdgesToViewController:self withInsets:edgeInsets exculdingEdge:CGLayoutEdgeBottom];
    [paramView cg_autoEdgesToViewController:self withInsets:edgeInsets exculdingEdge:CGLayoutEdgeTop];
    
    [viewFromViewController cg_attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:paramView attribute:NSLayoutAttributeTop constant:-space];
    [viewFromViewController cg_attribute:NSLayoutAttributeHeight toItem:paramView];
    
    UIView *redView = [UIView cg_createViewWithBackgroundColor:[UIColor redColor]];
    [viewFromViewController addSubview:redView];
    [redView cg_autoEdgesToSuperviewEdgesWithInsets:edgeInsets];
    
    UIView *grayView    = [UIView cg_createViewWithBackgroundColor:[UIColor grayColor]];
    [paramView addSubview:grayView];
    UIView *orangeView  = [UIView cg_createViewWithBackgroundColor:[UIColor orangeColor]];
    [paramView addSubview:orangeView];
    
    [grayView cg_autoEdgesToSuperviewEdgesWithInsets:edgeInsets excludingEdge:CGLayoutEdgeBottom];
    [orangeView cg_autoEdgesToSuperviewEdgesWithInsets:edgeInsets excludingEdge:CGLayoutEdgeTop];
    [grayView cg_attribute:NSLayoutAttributeHeight toItem:orangeView];
    [grayView cg_attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:orangeView attribute:NSLayoutAttributeTop constant:-space];
//    [paramView cg_autoDimension:CGDimensionHeight fixedLength:100];
//    [viewFromViewController cg_autoDimension:CGDimensionHeight fixedLength:100];
}

@end
