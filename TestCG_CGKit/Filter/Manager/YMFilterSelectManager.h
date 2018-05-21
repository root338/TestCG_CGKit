//
//  YMFilterSelectManager.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 ym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMFilterDefineHeader.h"

NS_ASSUME_NONNULL_BEGIN

@class YMFilterSortModel, YMFilterSelectManager, YMFilterSortError;

@protocol YMAppFilterModelProtocol;

typedef id<YMAppFilterModelProtocol> YMFilterProtocol;

@protocol YMFilterSelectDelegate <NSObject>

@required

/// 所需要的数据
- (YMFilterSortModel *)filterSortModelWithManager:(YMFilterSelectManager *)manager;

/// 选中后的回调
- (void)manager:(YMFilterSelectManager *)manager didSelectedModel:(YMFilterProtocol)filterModel;

@optional
/// 是否应该选中
- (BOOL)manager:(YMFilterSelectManager *)manager shouldSelectedModel:(YMFilterProtocol)filterModel;

/// 是否应该执行指定的动画
- (BOOL)manager:(YMFilterSelectManager *)manager shouldAnimatedWithType:(YMFilterAnimatedType)type;

/// 错误的回调
- (void)manager:(YMFilterSelectManager *)manager error:(YMFilterSortError *)error;

/// 完全重写选择视图
- (YMFilterSelectContentView *)manager:(YMFilterSelectManager *)manager filterViewWithModel:(YMFilterSortModel *)filterSortModel;

/// 自定义动画
- (void)manager:(YMFilterSelectManager *)manager customAnimatedWithView:(YMFilterSelectContentView *)selectedView style:(YMFilterAnimatedStyle)style;
/// 使用默认筛选项时的item类型YMFilterSortViewStyle
- (YMFilterSortViewStyle)manager:(YMFilterSelectManager *)manager itemStyleWithFilterModel:(YMFilterSortModel *)filterModel;

///// 多少组数据
//- (NSInteger)numberOfSectionsFilterWithManager:(YMFilterSelectManager *)manager;
///// 应该显示的组
//- (NSInteger)shouldShowFilterSectionsWithManager:(YMFilterSelectManager *)manager;
/////


@end

typedef NS_ENUM(NSInteger, YMFilterSortViewShowType) {
    YMFilterSortViewShowTypeFromTopToBottom,
};

@interface YMFilterSelectManager : NSObject

@property (nonatomic, assign) YMFilterSortViewShowType showType;
/// 当前使用的数据
@property (nullable, nonatomic, strong, readonly) YMFilterSortModel *currentFilterSortModel;
/// 当前使用的视图
@property (nullable, nonatomic, strong, readonly) YMFilterSelectContentView *currentFilterSelectView;
/// 将要显示新视图时，隐藏之前显示的视图
@property (nonatomic, assign) BOOL willShowIsHideAfterShowView;

@property (nonatomic, weak) UIView *superview;
@property (nonatomic, weak) UIView *relativeView;
@property (nonatomic, assign) YMFilterSelectViewRelativeType relativeType;
/// 使用默认item时，的预定样式, 默认YMFilterSortViewStyleTableView
@property (nonatomic, assign) YMFilterSortViewStyle itemStyle;

@property (nonatomic, weak) id<YMFilterSelectDelegate> delegate;

- (void)show;
- (void)hide;

@end

NS_ASSUME_NONNULL_END
