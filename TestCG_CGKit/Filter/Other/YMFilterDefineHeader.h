//
//  YMFilterDefineHeader.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/11.
//  Copyright © 2018年 ym. All rights reserved.
//

#ifndef YMFilterDefineHeader_h
#define YMFilterDefineHeader_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef UIView YMFilterSelectContentView;

#pragma mark - 动画
/**
 动画的样式

 - YMFilterAnimatedStyleShow: 显示
 - YMFilterAnimatedStyleHide: 隐藏
 */
typedef NS_ENUM(NSInteger, YMFilterAnimatedStyle) {
    YMFilterAnimatedStyleShow,
    YMFilterAnimatedStyleHide,
};

/**
 动画类型

 - YMFilterAnimatedTypeWillShowHideAfterView: 在将要显示时隐藏隐藏以前的视图
 - YMFilterAnimatedTypeWillHide: 将要显示
 - YMFilterAnimatedTypeWillShow: 将要隐藏
 */
typedef NS_ENUM(NSInteger, YMFilterAnimatedType) {
    YMFilterAnimatedTypeWillShowHideAfterView,
    YMFilterAnimatedTypeWillHide,
    YMFilterAnimatedTypeWillShow,
};

#pragma mark - 视图

/**
 筛选视图的样式

 - YMFilterSortViewStyleTableView: 表格类型
 */
typedef NS_ENUM(NSInteger, YMFilterSortViewStyle) {
    YMFilterSortViewStyleTableView,
};

/**
 弹层相对于filterSelectViewRelativeView视图的层级

 - YMFilterSelectViewRelativeTypeBelow: filterSelectViewRelativeView视图下面
 - YMFilterSelectViewRelativeTypeAbove: filterSelectViewRelativeView视图上面
 */
typedef NS_ENUM(NSInteger, YMFilterSelectViewRelativeType) {
    YMFilterSelectViewRelativeTypeBelow,
    YMFilterSelectViewRelativeTypeAbove,
};

#pragma mark - 错误

/**
 执行动画的错误

 - YMFilterSortErrorTypeUnknown: 未知
 - YMFilterSortErrorTypeNoError: 没有错误
 - YMFilterSortErrorTypeNoSuperview: 没有父视图
 - YMFilterSortErrorTypeNoTargetView: 没有可执行的视图
 */
typedef NS_ENUM(NSInteger, YMFilterSortErrorType) {
    YMFilterSortErrorTypeUnknown = -1,
    YMFilterSortErrorTypeNoError = 0,
    YMFilterSortErrorTypeNoSuperview,
    YMFilterSortErrorTypeNoTargetView,
};



#endif /* YMFilterDefineHeader_h */
