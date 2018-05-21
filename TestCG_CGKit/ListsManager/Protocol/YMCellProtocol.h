//
//  YMCellProtocol.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 ym. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// cell改变的类型
typedef NS_OPTIONS(NSInteger, YMCellChangeLayoutType) {
    YMCellChangeLayoutTypeUpdateConstraints = 1 << 0,
    YMCellChangeLayoutTypeUpdateLayout = 1 << 2,
    YMCellChangeLayoutTypeUpdateConstraintAndLayout = YMCellChangeLayoutTypeUpdateConstraints | YMCellChangeLayoutTypeUpdateLayout,
};

/**
 更新cell的源

 - YMCellUpdateSourceTypeCalculateHeight: 计算高度, 如: tableView:heightForRowAtIndexPath:
 - YMCellUpdateSourceTypeCreateCell: 创建cell, 如: tableView:cellForRowAtIndexPath:
 */
typedef NS_ENUM(NSInteger, YMCellUpdateSourceType) {
    YMCellUpdateSourceTypeCalculateHeight,
    YMCellUpdateSourceTypeCreateCell,
};

/// cell 的协议
@protocol YMCellProtocol <NSObject>

@required
/// 设置cell数据
- (void)setupContentViewWithData:(id)data;

@optional

/// cell 高度
@property (nonatomic, assign, readonly) CGFloat cellHeight;
@property (nonatomic, assign, readonly) BOOL constraintCalculateCellHeight;
/// 是否约束更新
- (BOOL)updateConstraintsWithSourceType:(YMCellUpdateSourceType)sourceType;
/// 是否布局更新
- (BOOL)updateLayoutWithSourceType:(YMCellUpdateSourceType)sourceType;

@end

NS_ASSUME_NONNULL_END
