//
//  YMFilterSelectViewItem.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/11.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMFilterDefineHeader.h"

@class YMFilterSortModel, CGSelectorView;

NS_ASSUME_NONNULL_BEGIN

@protocol YMFilterSelectViewItemDelegate <NSObject>

@required
/// 弹层添加的父视图
@property (nonatomic, readonly) UIView *superview;
/// 弹层的相对视图
@property (nonatomic, readonly) UIView *relativeView;
/// 弹层在相对视图的位置
@property (nonatomic, readonly) YMFilterSelectViewRelativeType relativeType;

@end

@protocol YMFilterSelectViewItem <NSObject>

@property (nonatomic, assign, readonly) YMFilterSortViewStyle style;

@property (nonatomic, strong) YMFilterSortModel *filterSortModel;

@property (nonatomic, strong, readonly) CGSelectorView *selectorView;

@property (nullable, nonatomic, weak) id<YMFilterSelectViewItemDelegate> delegate;

@end

@interface YMFilterSelectViewItem : NSObject<YMFilterSelectViewItem>

+ (instancetype)createItemWithStyle:(YMFilterSortViewStyle)style;

- (instancetype)initWithStyle:(YMFilterSortViewStyle)style;
@end

NS_ASSUME_NONNULL_END
