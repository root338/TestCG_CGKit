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
#import "UIView+CGUpdateConstraints.h"
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
    
//    [self testDoubleViewToViewController];
    [self test5];
    
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

- (void)test2
{
    /** 测试 UIView (CGSuperviewConstranint) 扩展方法 */
    UIView *redView = [UIView cg_createViewWithBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    [redView cg_autoEdgesToViewController:self withInsets:UIEdgeInsetsMakeAllEqualValue(15)];
    
    UIView * yellowView   = [UIView cg_createViewWithBackgroundColor:[UIColor yellowColor]];
    [redView addSubview:yellowView];
    
    NSMutableArray *constranints    = [NSMutableArray array];
    [constranints addObject:[yellowView cg_autoConstrainToSuperviewAttribute:NSLayoutAttributeTop withOffset:20] ];
    [constranints addObject:[yellowView cg_autoConstrainToSuperviewAttribute:NSLayoutAttributeLeading withOffset:20]];
//    [constranints addObject:[yellowView cg_autoConstrainToSuperviewAttribute:NSLayoutAttributeBottom withOffset:20]];
//    [constranints addObject:[yellowView cg_autoConstrainToSuperviewAttribute:NSLayoutAttributeTrailing withOffset:20]];
    [constranints addObject:[yellowView cg_autoConstrainToSuperviewAttribute:NSLayoutAttributeLeading withOffset:20 relation:NSLayoutRelationLessThanOrEqual]];
    [constranints addObject:[yellowView cg_autoConstrainToSuperviewAttribute:NSLayoutAttributeBottom withOffset:20 relation:NSLayoutRelationLessThanOrEqual]];
    [constranints addObject:[yellowView cg_autoConstrainToSuperviewAttribute:NSLayoutAttributeTrailing withOffset:20 relation:NSLayoutRelationLessThanOrEqual]];
    
}

- (void)test3
{
    //测试 UIView (CGViewControllerConstraint) 扩展方法
    UIView *blueView    = [UIView cg_createViewWithBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];
    
    [blueView cg_topLayoutGuideOfViewController:self withInset:20 relatedBy:NSLayoutRelationLessThanOrEqual];
    [blueView cg_autoConstrainToSuperviewAttribute:NSLayoutAttributeLeading withOffset:20];
    [blueView cg_bottomLayoutGuideOfViewController:self withInset:20 relatedBy:NSLayoutRelationLessThanOrEqual];
    [blueView cg_autoConstrainToSuperviewAttribute:NSLayoutAttributeTrailing withOffset:20];
}

- (void)test4
{
    //测试 UIView (CGSuperviewConstranint)
    UIView *greenView   = [UIView cg_createViewWithBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:greenView];
    [greenView cg_autoEdgesToViewController:self withInsets:UIEdgeInsetsMakeAllEqualValue(20)];
    
    UIView *grayView    = [UIView cg_createViewWithBackgroundColor:[UIColor grayColor]];
    [greenView addSubview:grayView];
    [grayView cg_autoEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMakeAllEqualValue(20) excludingEdge:CGLayoutEdgeBottom];
    [grayView cg_autoConstrainToSuperviewAttribute:NSLayoutAttributeBottom withOffset:20 relation:NSLayoutRelationLessThanOrEqual];
}

- (void)test5
{
    //测试UIView (CGViewDimensionConstraint)
    UIView *grayView    = [UIView cg_createViewWithBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:grayView];
    
    UIView *orangeView  = [UIView cg_createViewWithBackgroundColor:[UIColor orangeColor]];
    [grayView addSubview:orangeView];
    
    [grayView cg_updateAutoEdgesToViewController:self withInsets:UIEdgeInsetsMakeAllEqualValue(20)];
    [orangeView cg_updateAutoSetupViewSize:CGSizeMake(100, 100)];
    [orangeView cg_updateAutoCenterToSameAxisOfView:grayView];
    
    NSLog(@"%lu", (unsigned long)self.view.constraints.count);
    NSLog(@"%lu", (unsigned long)grayView.constraints.count);
    NSLog(@"%lu", (unsigned long)orangeView.constraints.count);
    
//    [orangeView cg_autoDimension:CGDimensionWidth fixedLength:100 relation:NSLayoutRelationGreaterThanOrEqual];
//    [orangeView cg_autoDimension:CGDimensionHeight view:grayView relatedBy:NSLayoutRelationGreaterThanOrEqual];
    
//    [orangeView cg_autoAxis:CGAxisVertical toSameAxisOfView:grayView withOffset:100];
//    [orangeView cg_autoConstrainToSuperviewAttribute:NSLayoutAttributeTop withOffset:20];
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
