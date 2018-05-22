//
//  CGTestSubviewViewController.m
//  TestCG_CGKit
//
//  Created by apple on 16/8/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestSubviewViewController.h"

#import "UIView+CGSetupFrame.h"
#import "UIView+CGAddConstraints.h"
#import "UIView+CGFlowSubviewsSetup.h"

#import "CGCreateSubviewsFlowLayoutConfigModel.h"
#import "CGUpdateSubviewsFlowLayoutConfigModel.h"

@interface CGTestSubviewViewController ()
{
    UIScrollView *_scrollView;
    
    UIView          *contentView;
}

@end

@implementation CGTestSubviewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:_scrollView];
    [_scrollView cg_autoEdgesInsetsZeroToSuperview];
    
    contentView = [[UIView alloc] init];
    contentView.width   = self.view.width;
    [_scrollView addSubview:contentView];
    [contentView cg_autoEdgesInsetsZeroToSuperview];
    
    [self testFlowLayoutSubviews];
}

- (void)testFlowLayoutSubviews
{
    
    NSArray *titleLabel = @[
                            @"kdjfldj",
                            @"来到房间大哭",
                            @"来到房", @"间的路口", @"附近的", @"理发店几分劳动就分手了",
                            @"大家来发神经发来的",
                            @"家里的减肥了",
                            @"劳动节费拉达斯几分劳动时间发的是雷锋精神德累斯顿发生的集散地",
                            @"来的减肥了",
                            ];
    
    CGCreateSubviewsFlowLayoutConfigModel *subviewsAppearance    = [[CGCreateSubviewsFlowLayoutConfigModel alloc] init];
    
    subviewsAppearance.alignmentType                = CGAlignmentTypeHorizontal;
    subviewsAppearance.subviewsVerticalAlignment    = CGViewVerticalAlignmentBottom;
    subviewsAppearance.isUseCreateViewSize  = YES;
    subviewsAppearance.totalCount           = titleLabel.count;
    subviewsAppearance.lineSpacing          = 10;
    subviewsAppearance.interitemSpacing     = 8;
    subviewsAppearance.marginEdgeInsets     = UIEdgeInsetsMake(20, 15, 20, 15);
    
    CGSize contentSize  = [contentView cg_createFlowViewsWithRule:subviewsAppearance createSubviewBlock:^UIView * _Nonnull(NSInteger index, UIView * _Nullable view) {
        UILabel *label          = [[UILabel alloc] init];
        label.text              = titleLabel[index];
        [label sizeToFit];
        if (index == 0) {
            label.height += 20;
        }
        label.backgroundColor   = [UIColor orangeColor];
        return label;
    } setupSubviewSizeBlock:nil failureBlock:nil];
    
    contentView.size            = contentSize;
    contentView.backgroundColor = [UIColor lightGrayColor];
    
    [contentView cg_autoSetupViewSize:contentSize];
    
    UIButton *button    = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"update flow subviews" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button cg_autoEdgesInsetsZeroToViewController:self exculdingEdge:CGLayoutEdgeTop];
    [button addTarget:self action:@selector(handleUpdateFlowSubviews:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleUpdateFlowSubviews:(id)sender
{
    static  CGUpdateSubviewsFlowLayoutConfigModel *subviewsAppearance   = nil;
    
    if (!subviewsAppearance) {
        
        subviewsAppearance    = [[CGUpdateSubviewsFlowLayoutConfigModel alloc] init];
        
        subviewsAppearance.alignmentType                = CGAlignmentTypeHorizontal;
        
        subviewsAppearance.totalCount           = contentView.subviews.count;
        subviewsAppearance.lineSpacing          = 10;
        subviewsAppearance.interitemSpacing     = 8;
        subviewsAppearance.marginEdgeInsets     = UIEdgeInsetsMake(20, 15, 20, 15);
        subviewsAppearance.contentMaxWidth      = self.view.width;
    }
    
//    subviewsAppearance.subviewsVerticalAlignment    += 1;
//    if (subviewsAppearance.subviewsVerticalAlignment > CGViewVerticalAlignmentBottom) {
//        subviewsAppearance.subviewsVerticalAlignment    = CGViewVerticalAlignmentTop;
//    }
//    subviewsAppearance.alignmentType    = CGAlignmentTypeVertical;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGSize contentSize  = [self->contentView cg_updateFlowViewsWithRule:subviewsAppearance setupSubviewSizeBlock:^CGSize(__kindof UIView * _Nonnull view, NSInteger index) {
            return CGSizeMake(view.size.width + 10, view.size.height + 10);
        } failureBlock:nil];
        [UIView cg_autoSetUpdate:YES forConstraints:^{
            [self->contentView cg_autoSetupViewSize:contentSize];
        }];
        [self->contentView setNeedsUpdateConstraints];
        [self->contentView layoutIfNeeded];
    }];
}

@end
