//
//  YMListsSourceDataModel.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 ym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMListStatusHeader.h"

@class YMListsSourceDataModel;

NS_ASSUME_NONNULL_BEGIN

@protocol YMListsSourceDataDelegate <NSObject>

@optional
/// 设置当前data需要添加的索引
- (NSInteger)listsModel:(YMListsSourceDataModel *)listsModel data:(id)data isFirstData:(BOOL)isFirstData;
/// 自行设置旧数据与新数据的更新 isSingleLists = NO 时调用
- (id)listsModel:(YMListsSourceDataModel *)listsModel newData:(id)newData oldData:(id)oldData isFirstData:(BOOL)isFirstData;

/// 数据加载的状态
- (YMSourceDataStatus)listsModel:(YMListsSourceDataModel *)listsModel sourceStatusFordata:(id)data isFirstData:(BOOL)isFirstData;

/// 当 isSingleLists = YES 时，返回的数据不为数组时调用
- (NSArray *)listsModel:(YMListsSourceDataModel *)listsModel handleNotListsData:(id)data isFirstData:(BOOL)isFirstData;

@end

/**
 列表数据模型
 */
@interface YMListsSourceDataModel : NSObject
/**
 数据加载的状态
 没有设置代理自行按照单列数组进行判断, isSingleLists 必须为YES
 */
@property (nonatomic, assign) YMSourceDataStatus status;
#pragma mark - 单列表下实例
/// 单列表
@property (nonatomic, assign) BOOL isSingleLists;
/// 数据是否为空, 若是单列数组当数组count=0时返回YES, isSingleLists 必须为YES
@property (nonatomic, assign, readonly) BOOL isEmpty;
/// 数组的大小长度，当数据返回没有该值大时，表示数据加载完成, isSingleLists 必须为YES
@property (nonatomic, assign) NSInteger pageSize;
/// 返回第一次添加的数组大小, isSingleLists 必须为YES, 兼容性问题，API没有指定pageSize的情况, 默认第一次加载的数据最多, 单列数组有效!!!
@property (nonatomic, assign, readonly) NSInteger firstDataSize;

/// 所有的索引
@property (nullable, nonatomic, strong, readonly) NSArray *allIndexs;

@property (nullable, nonatomic, weak) id<YMListsSourceDataDelegate> delegate;

- (instancetype)initWithDelegate:(nullable id<YMListsSourceDataDelegate>)delegate;

- (void)addData:(nullable id)sourceData isFirstData:(BOOL)isFirstData;

- (nullable id)dataWithIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
