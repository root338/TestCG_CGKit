//
//  YMTableViewProtocolManager.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "MLListsManagerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class YMListsProtocolManager;

@protocol YMListsManagerProtocol <NSObject>

@property (nonatomic, weak, readonly) UITableView *tableView;
@property (nonatomic, weak, readonly) UIViewController *sender;

- (void)addNewData:(nullable NSArray *)data page:(NSInteger)page;
- (void)resetAllSourceDataListWithNewData:(nullable NSArray *)data;

@end

@interface YMListsProtocolManager : NSObject<YMListsManagerProtocol, UITableViewDelegate, UITableViewDataSource>

#pragma mark - 数据配置
///// 加载的每页大小
//@property (nonatomic, assign) NSInteger pageSize;
///// 关闭加载结束自动添加结束标识, 默认 NO
//@property (nonatomic, assign) BOOL disableLoadEndAutoEndMark;
///// 关闭加载为空时自动添加空标识, 默认 NO
//@property (nonatomic, assign) BOOL disableLoadNullAutoEndNullMark;
///// 关闭加载结束时自动移除页脚刷新视图, 默认 NO
//@property (nonatomic, assign) BOOL disableLoadEndAutoRemoveFooterRefreshView;
/// cell 的标识
@property (nullable, nonatomic, strong) NSString *cellIdentifier;
/// 注册 cell 的类
@property (nullable, nonatomic, strong) Class registerCellClass;
/// 管理tableView代理
@property (nonatomic, weak) id<YMListsManagerDelegate> delegate;
/// cell高度计算增量的偏移量，如：在cell有低线的状态下需要设置为 1
@property (nonatomic, assign) CGFloat cellHeightAddOffsetValue;

#pragma mark - 对外弱引用

@property (nonatomic, weak) UIViewController *sender;
@property (nonatomic, weak) UITableView *tableView;

#pragma mark - 自定义设置

/// cell 的高度 设置该值时不进行其他的计算，忽略
@property (nonatomic, assign) CGFloat cellHeight;
/// 
@property (nonatomic, assign) CGFloat estimatedRowHeight;

#pragma mark - 初始化
- (instancetype)initWithTableView:(nullable UITableView *)tableView registerCellClass:(nullable Class)registerCellClass;

#pragma mark - 数据处理
//
- (void)addNewData:(nullable NSArray *)data page:(NSInteger)page;
- (void)resetAllSourceDataListWithNewData:(nullable NSArray *)data;



@end
NS_ASSUME_NONNULL_END
