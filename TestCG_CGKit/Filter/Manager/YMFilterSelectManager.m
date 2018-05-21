//
//  YMFilterSelectManager.m
//  QuickAskCommunity
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMFilterSelectManager.h"
#import "YMFilterSelectViewItem.h"

#import "YMFilterSortError.h"

@interface YMFilterSelectManager ()<YMFilterSelectViewItemDelegate>

@property (nonatomic, strong) YMFilterSelectViewItem *item;

@property (nullable, nonatomic, strong, readwrite) YMFilterSortModel *currentFilterSortModel;

/// 当前使用的视图
@property (nullable, nonatomic, strong, readwrite) YMFilterSelectContentView *currentFilterSelectView;

@end

@implementation YMFilterSelectManager

- (void)show
{
    if (self.currentFilterSelectView) {
        BOOL isHideAfterView = self.willShowIsHideAfterShowView;
        if ([self.delegate respondsToSelector:@selector(manager:shouldAnimatedWithType:)]) {
            isHideAfterView = [self.delegate manager:self shouldAnimatedWithType:YMFilterAnimatedTypeWillShowHideAfterView];
        }
        if (isHideAfterView) {
            [self handleViewAnimatedWithStyle:YMFilterAnimatedStyleHide];
        }
    }
    
    self.currentFilterSortModel = [self.delegate filterSortModelWithManager:self];
    YMFilterSelectContentView *filterView = nil;
    if ([self.delegate respondsToSelector:@selector(manager:filterViewWithModel:)]) {
        filterView = [self.delegate manager:self filterViewWithModel:self.currentFilterSortModel];
    }else {
        
        self.item.filterSortModel = self.currentFilterSortModel;
        filterView = (UIView *)self.item.selectorView;
    }
    
    [self handleViewAnimatedWithStyle:YMFilterAnimatedStyleShow];
}

- (void)hide
{
    YMFilterAnimatedType type = YMFilterAnimatedTypeWillHide;
    YMFilterAnimatedStyle style = YMFilterAnimatedStyleHide;
    YMFilterSortErrorType errType = YMFilterSortErrorTypeNoError;
    
    if (!self.currentFilterSelectView) {
        errType = YMFilterSortErrorTypeNoTargetView;
    }else if (!self.currentFilterSelectView.superview) {
        errType = YMFilterSortErrorTypeNoSuperview;
    }
    
    if (errType == YMFilterSortErrorTypeNoError) {
        [self handleViewAnimatedWithStyle:style];
    }else {
        [self handleAnimatedErrorWithType:type style:style errorType:errType];
    }
}

- (void)handleViewAnimatedWithStyle:(YMFilterAnimatedStyle)style
{
    
    if ([self.delegate respondsToSelector:@selector(manager:customAnimatedWithView:style:)]) {
        [self.delegate manager:self customAnimatedWithView:self.currentFilterSelectView style:style];
    }else {
        
    }
}

- (void)handleAnimatedErrorWithType:(YMFilterAnimatedType)type style:(YMFilterAnimatedStyle)style errorType:(YMFilterSortErrorType)errorType
{
    if ([self.delegate respondsToSelector:@selector(manager:error:)]) {
        YMFilterSortError *error = [[YMFilterSortError alloc] init];
        error.animatedType = type;
        error.animatedStyle = style;
        error.errorType = errorType;
        [self.delegate manager:self error:error];
    }
}

#pragma mark - Properties

- (YMFilterSelectViewItem *)item
{
    if (_item) {
        return _item;
    }
    
    _item = [YMFilterSelectViewItem createItemWithStyle:YMFilterSortViewStyleTableView];
    
    
    return _item;
}

@end
