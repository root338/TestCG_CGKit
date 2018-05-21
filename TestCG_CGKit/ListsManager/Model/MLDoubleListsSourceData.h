//
//  MLDoubleListsSourceDataModel.h
//  TestCG_CGKit
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLListsDefineHeader.h"
#import "MLListsSourceDataItem.h"

NS_ASSUME_NONNULL_BEGIN

@class MLDoubleListsSourceData;

@protocol MLDoubleListsSourceDataDelegate <NSObject>

//@required

@optional

/// 每组的分页大小
- (NSInteger)pageSizeWithIndex:(NSInteger)index;

/// 处理数据加载的状态
- (MLListsSourceDataStatus)listsModel:(MLDoubleListsSourceData *)listsModel statusWithIndex:(NSInteger)index;

@end

/** 多索引列表数据 */
@interface MLDoubleListsSourceData<__covariant ObjectType> : NSObject

@property (nonatomic, weak) id<MLDoubleListsSourceDataDelegate> delegate;
/// 数据是否为空
@property (nonatomic, assign, readonly) BOOL isEmpty;

#pragma mark - 分页

/**
 pageSize 动态变换, 默认为NO
 
 当为 YES 时，每组的 pageSize 无效，这时不会调用代理方法 pageSizeWithIndex:
 */
@property (nonatomic, assign) BOOL pageSizeDynamicChange;
/// 每页的数量, 初始化为 -1
@property (nonatomic, assign) NSInteger pageSize;
/// 添加第一页数据时删除这个索引的所有数据, 默认 YES
@property (nonatomic, assign) BOOL addFirstPageRemoveIndexAllData;

#pragma mark - 索引

/// 索引总数
@property (nonatomic, assign, readonly) NSInteger totalIndex;
/// 索引列表
@property (nullable, nonatomic, strong, readonly) NSArray<NSNumber *> *allIndexs;

/// 添加单组单页数据
- (void)addPageList:(NSArray<ObjectType> *)pageList page:(NSInteger)page index:(NSInteger)index;

/// 获取指定索引下的列表数据
- (MLListsSourceDataItem<ObjectType> *)itemWithIndex:(NSInteger)index;

/// 移除指定索引
- (MLListsSourceDataItem<ObjectType> *)removeWithIndex:(NSInteger)index;


@end

NS_ASSUME_NONNULL_END
