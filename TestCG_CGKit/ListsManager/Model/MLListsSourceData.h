//
//  MLListsSourceDataModel.h
//  TestCG_CGKit
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** 单组列表数据 */
@interface MLListsSourceData <__covariant ObjectType> : NSObject

/// 单组列表的总数据数
@property (nonatomic, assign, readonly) NSInteger totalCount;
/// 是否为空
@property (nonatomic, assign, readonly) BOOL isEmpty;

/** 移除所有数据 */
- (void)removeAllPageList;

#pragma mark - 每页列表数据处理

/** 添加指定页的list数据 */
- (void)addPageList:(nullable NSArray<ObjectType> *)pageList page:(NSInteger)page;

/** 获取指定页的list */
- (nullable NSArray<ObjectType> *)listWithPage:(NSInteger)page;

/** 移除指定页的list */
- (nullable NSArray<ObjectType> *)removeListWithPage:(NSInteger)page;

/** 移除指定list */
- (nullable NSArray<ObjectType> *)removePageList:(NSArray<ObjectType> *)list;

#pragma mark - 单对象处理

/** 获取指定索引的单个数据 */
- (void)objectWithIndex:(NSInteger)index modelBlock:(void (^ _Nullable) (NSInteger page, ObjectType _Nullable obj))modelBlock;

/** 移除指定索引的单个数据 */
- (BOOL)removeWithIndex:(NSInteger)index modelBlock:(void (^ _Nullable) (NSInteger page, ObjectType _Nullable obj))modelBlock;

/** 移除指定对象 */
- (BOOL)removeWithObj:(id)obj modelBlock:(void (^ _Nullable) (NSInteger page, ObjectType _Nullable obj))modelBlock;

@end

NS_ASSUME_NONNULL_END
