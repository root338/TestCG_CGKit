//
//  CGTestLayoutConstranintsViewController.m
//  TestCG_CGKit
//
//  Created by apple on 16/4/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestLayoutConstranintsViewController.h"

#import "CGTitleLabelLayoutView.h"
#import "CGTitleImageLayoutView.h"
#import "CGTitleButtonsLayoutView.h"

#import "UIView+CGCreateViews.h"
#import "UIEdgeInsets+Category.h"
#import "UIView+CGAddConstraints.h"
#import "NSArray+CGAddConstraints.h"
#import "UIView+CGAddConstraintsForSubviews.h"

#import "CGTwoSubviewsConstraintsAppearance.h"

@interface CGTestLayoutConstranintsViewController ()
{
    UIView *viewFromViewController;
    
    CGTitleLabelLayoutView *_titleLabelView;
}
@end

@implementation CGTestLayoutConstranintsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self testTitleViews];
    [self testMarginTitleView];
    self.view.backgroundColor   = [UIColor whiteColor];
}

- (void)testMarginTitleView
{
    CGTitleLabelLayoutView *titleLabelView   = [[CGTitleLabelLayoutView alloc] init];
    UIButton    *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"click button" forState:UIControlStateNormal];
    
    titleLabelView.backgroundColor  = [UIColor orangeColor];
    titleLabelView.titleLabel.backgroundColor   = [UIColor lightGrayColor];
    
    [self.view addSubview:titleLabelView];
    [self.view addSubview:button];
    
    self.view.backgroundColor   = [UIColor greenColor];
    button.backgroundColor      = [UIColor blueColor];
    
    [button cg_autoDimension:CGDimensionHeight fixedLength:40];
    self.view.subviews.subviewsSpaceValue   = 15;
    [self.view.subviews cg_autoSetupVerticalSubviewsLayoutWithViewController:self];
    
    _titleLabelView = titleLabelView;
    
    [button addTarget:self action:@selector(changeTitleLabelView:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)changeTitleLabelView:(id)sender
{
    UIEdgeInsets insets = _titleLabelView.marginEdgeInsets;
    CGFloat value = 5;
    _titleLabelView.marginEdgeInsets    = UIEdgeInsetsMake(insets.top + value, insets.left + value, insets.bottom + value, insets.right + value);
}

- (void)testTwoSubviews
{
    UIView *superview   = [[UIView alloc] init];
    superview.backgroundColor   = [UIColor blueColor];
    
    UIView *firstView   = [[UIView alloc] init];
    firstView.backgroundColor   = [UIColor lightGrayColor];
    [superview addSubview:firstView];
    
    UIView *secondView  = [[UIView alloc] init];
    secondView.backgroundColor  = [UIColor orangeColor];
    [superview addSubview:secondView];
    
    [self.view addSubview:superview];
    
    CGTwoSubviewsConstraintsAppearance *config  = [[CGTwoSubviewsConstraintsAppearance alloc] init];
    config.edgeInsets   = UIEdgeInsetsMakeAllEqualValue(15);
    config.firstViewToSecondViewSpace   = 15;
    config.widthEqual       = YES;
    config.firstViewSize    = CGSizeMake(100, 100);
//    config.secondViewHeight = 50;
//    config.secondViewCenter = YES;
//    config.firstViewEqualSecondViewEdge = CGLayoutEdgeTop;
    
    [superview cg_autoTwoSubviewsWithConfig:config];
    [superview cg_autoEdgesToViewController:self
                                 withInsets:UIEdgeInsetsMakeAllEqualValue(15)
                                       edge:CGLayoutOptionEdgeLeftTop];
}

- (void)testTitleViews
{
    CGTitleLabelLayoutView *titleLabel   = [[CGTitleLabelLayoutView alloc] initWithMarginEdgeInstes:UIEdgeInsetsMakeAllEqualValue(15)];
    titleLabel.titleLabel.text   = @"测试 CGTitleLabelayoutView\n\
                                    测试 CGTitleLabelayoutView\n\
                                    测试 CGTitleLabelayoutView";
    titleLabel.titleLabel.numberOfLines = 0;
    titleLabel.backgroundColor          = [UIColor orangeColor];
    
    CGTitleButtonsLayoutView *buttonsView   = [[CGTitleButtonsLayoutView alloc] init];
    buttonsView.marginEdgeInsets            = UIEdgeInsetsMakeAllEqualValue(8);
    buttonsView.firstTargetViewEdgeInsets   = UIEdgeInsetsMakeAllEqualValue(15);
    buttonsView.secondTargetViewEdgeInsets  = UIEdgeInsetsMakeAllEqualValue(15);
    buttonsView.targetViewsBetweenSapce     = 8;
    [buttonsView.firstButton setTitle:@"first button" forState:UIControlStateNormal];
    [buttonsView.secondButton setTitle:@"second button" forState:UIControlStateNormal];
    [buttonsView setBackgroundColor:[UIColor darkGrayColor]];
    [buttonsView.firstButton setBackgroundColor:[UIColor blueColor]];
    [buttonsView.secondButton setBackgroundColor:[UIColor greenColor]];
    buttonsView.alignment   = CGAlignmentTypeVertical;
    
    CGTitleImageLayoutView  *titleImages    = [[CGTitleImageLayoutView alloc] init];
    titleImages.marginEdgeInsets            = UIEdgeInsetsMakeAllEqualValue(8);
    titleImages.firstTargetViewEdgeInsets   = UIEdgeInsetsMakeAllEqualValue(15);
    titleImages.secondTargetViewEdgeInsets  = UIEdgeInsetsMakeAllEqualValue(15);
    titleImages.targetViewsBetweenSapce     = 8;
    [titleImages.titleLabel setText:@"测试 CGTitleImageLayoutView"];
    [titleImages setBackgroundColor:[UIColor redColor]];
    [titleImages.titleLabel setBackgroundColor:[UIColor lightGrayColor]];
    [titleImages.imageView setBackgroundColor:[UIColor orangeColor]];
    
    [self.view addSubview:titleLabel];
    [self.view addSubview:buttonsView];
    [self.view addSubview:titleImages];
    
    NSArray *views = @[
                       titleLabel,
                       buttonsView,
                       titleImages,
                       ];
    [views cg_autoSetupVerticalSubviewsLayoutWithViewController:self];
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
    paramView.translatesAutoresizingMaskIntoConstraints     = NO;
    
    [viewFromViewController cg_autoEdgesToViewController:self withInsets:edgeInsets exculdingEdge:CGLayoutEdgeBottom];
    [paramView cg_autoEdgesToViewController:self withInsets:edgeInsets exculdingEdge:CGLayoutEdgeTop];
    
    [viewFromViewController cg_attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:paramView attribute:NSLayoutAttributeTop constant:space];
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
    [grayView cg_attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:orangeView attribute:NSLayoutAttributeTop constant:space];
//    [paramView cg_autoDimension:CGDimensionHeight fixedLength:100];
//    [viewFromViewController cg_autoDimension:CGDimensionHeight fixedLength:100];
}

@end
