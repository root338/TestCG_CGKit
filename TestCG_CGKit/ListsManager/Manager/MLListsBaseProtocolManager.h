//
//  MLListsBaseProtocolManager.h
//  TestCG_CGKit
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLListsManagerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLListsBaseProtocolManager<__covariant delegateType, __covariant ObjectType> : NSObject<UITableViewDataSource, UITableViewDelegate, MLListsProtocol>

@property (nonatomic, weak) delegateType delegate;
@property (nonatomic, weak) UITableView tableView;

/// 添加第一页数据时删除这个索引的所有数据, 默认 YES
@property (nonatomic, assign) BOOL addFirstPageRemoveIndexAllData;

#pragma mark - 初始化

/**
 初始化列表管理器
 
 默认配置:
 tableView.delegate = self;
 tableView.dataSource = self;
 */
- (instancetype)initWithTableView:(UITableView *)tableView;

#pragma mark - 数据处理

/**
 添加新数据

 @param data 新数据数组
 @param page 添加的页数
 @param index 添加的索引
 */
- (void)addNewData:(nullable NSArray<ObjectType> *)data page:(NSInteger)page index:(NSInteger)index;

/**
 获取指定索引(listIndex)下的, 列表中的第几个(index)数据实例
 */
- (nullable ObjectType)objectAtIndex:(NSInteger)index forListIndex:(NSInteger)listIndex;

@end

NS_ASSUME_NONNULL_END
