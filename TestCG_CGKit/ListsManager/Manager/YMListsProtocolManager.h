//
//  YMTableViewProtocolManager.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMListStatusHeader.h"

NS_ASSUME_NONNULL_BEGIN

@class YMListsProtocolManager;

/**
 表格管理器的类型

 - YMTableViewTypeDefault: 默认类型
 */
typedef NS_ENUM(NSInteger, YMTableViewType) {
    YMTableViewTypeDefault,
};

/**
 表格管理器的来源

 - YMTableViewSourceTypeUnknown: 未知
 */
typedef NS_ENUM(NSInteger, YMTableViewSourceType) {
    YMTableViewSourceTypeUnknown,
};

@protocol YMListsManagerDelegate <NSObject>

- (void)manager:(YMListsProtocolManager *)manager setupCell:(UITableViewCell *)cell data:(id)data;
- (CGFloat)manager:(YMListsProtocolManager *)manager heightWithData:(id)data indexPath:(NSIndexPath *)indexPath;
/// 实现manager:heightWithData:indexPath:方法时不会执行该方法
- (CGFloat)manager:(YMListsProtocolManager *)manager heightWithCell:(UITableViewCell *)cell data:(id)data indexPath:(NSIndexPath *)indexPath;

@end

@protocol YMListsManagerProtocol <NSObject>

@property (nonatomic, weak, readonly) UITableView *tableView;
@property (nonatomic, weak, readonly) UIViewController *sender;

- (void)addNewData:(nullable NSArray *)data page:(NSInteger)page;
- (void)resetAllSourceDataListWithNewData:(nullable NSArray *)data;

@end

@interface YMListsProtocolManager : NSObject<YMListsManagerProtocol, UITableViewDelegate, UITableViewDataSource>

#pragma mark - 管理器配置
/// 管理器类型
@property (nonatomic, assign, readonly) YMTableViewType type;
/// 源数据类型
@property (nonatomic, assign, readonly) YMTableViewSourceType sourceType;

#pragma mark - 数据配置
/// 加载的每页大小
@property (nonatomic, assign) NSInteger pageSize;
/// 关闭加载结束自动添加结束标识, 默认 NO
@property (nonatomic, assign) BOOL disableLoadEndAutoEndMark;
/// 关闭加载为空时自动添加空标识, 默认 NO
@property (nonatomic, assign) BOOL disableLoadNullAutoEndNullMark;
/// 关闭加载结束时自动移除页脚刷新视图, 默认 NO
@property (nonatomic, assign) BOOL disableLoadEndAutoRemoveFooterRefreshView;
/// cell 的标识
@property (nullable, nonatomic, strong) NSString *cellIdentifier;
/// 注册 cell 的类
@property (nullable, nonatomic, strong) Class registerCellClass;
/// 管理tableView代理
@property (nonatomic, weak) id<YMListsManagerDelegate> delegate;
/// cell高度计算增量的偏移量，如：在cell有低线的状态下需要设置为 1
@property (nonatomic, assign) CGFloat cellHeightAddOffsetValue;
/// 源数据加载的状态
//@property (nonatomic, assign, readonly) YMSourceDataStatus sourceDataStatus;
/// 页脚的处理方式
//@property (nonatomic, assign, readonly) YMHandleRefreshFooterType handleFooterType;
/// 数据加载完后的处理方式
//@property (nonatomic, assign, readonly) YMHandleLoadEndType handleLoadEndType;

#pragma mark - 对外弱引用

@property (nonatomic, weak) UIViewController *sender;
@property (nonatomic, weak) UITableView *tableView;

#pragma mark - 自定义设置
/// registerCell, dequeueReusableCell, cacheCell/cellHeight>0 三者是互协关系实现了一个，其他的都必须实现
/// 注册cell, 创建 registerCell block 必须实现 dequeueReusableCell block
//@property (nullable, nonatomic, copy) void (^registerCell) (UITableView * _Nullable tableView);
/// 获取cell, 创建 dequeueReusableCell block 必须实现 registerCell block
@property (nullable, nonatomic, copy) UITableViewCell * (^dequeueReusableCell) (UITableView *tableView, NSIndexPath *indexPath);
/// 获取计算高度的cell
@property (nullable, nonatomic, copy) UITableViewCell * (^cacheCell) (UITableView *tableView, NSIndexPath *indexPath);

/// cell 的高度 设置该值时不进行其他的计算，忽略
@property (nonatomic, assign) CGFloat cellHeight;
/// 
@property (nonatomic, assign) CGFloat estimatedRowHeight;

#pragma mark - 创建

/**
 创建指定类型 tableView 协议管理器
 
 如果同时设置 registerCellClass / tableView 会自动设置会设置如下项
 tableView.delegate = self;
 tableView.dataSource = self;
 NSString *cellIdentifier = NSStringFromClass(registerCellClass);
 [tableView registerClass:registerCellClass forCellReuseIdentifier:cellIdentifier];
 _cellIdentifier = cellIdentifier;
 */
+ (instancetype)createWithType:(YMTableViewType)type tableView:(nullable UITableView *)tableView registerCellClass:(nullable Class)registerCellClass;

#pragma mark - 初始化
- (instancetype)initWithTableView:(nullable UITableView *)tableView registerCellClass:(nullable Class)registerCellClass;

#pragma mark - 数据处理
//
- (void)addNewData:(nullable NSArray *)data page:(NSInteger)page;
- (void)resetAllSourceDataListWithNewData:(nullable NSArray *)data;



@end
NS_ASSUME_NONNULL_END
