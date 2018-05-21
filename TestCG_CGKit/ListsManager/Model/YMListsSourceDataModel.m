//
//  YMListsSourceDataModel.m
//  QuickAskCommunity
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMListsSourceDataModel.h"

@interface YMListsSourceDataModel ()

@property (nonatomic, assign, readwrite) NSInteger firstDataSize;

@property (nonatomic, readonly) NSMutableArray *sourcelists;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, id> *sourceListDict;

@end

@implementation YMListsSourceDataModel

- (instancetype)initWithDelegate:(nullable id<YMListsSourceDataDelegate>)delegate
{
    self = [super init];
    if (self) {
        _isSingleLists  = YES;
        _delegate       = delegate;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithDelegate:nil];
}

- (void)addData:(id)sourceData isFirstData:(BOOL)isFirstData
{
    // 设置数据的索引位置
    NSInteger index = 0;
    if ([self.delegate respondsToSelector:@selector(listsModel:data:isFirstData:)]) {
        index = [self.delegate listsModel:self data:sourceData isFirstData:isFirstData];
    }
    
    id data = nil;
    NSArray *didHandleNewData = nil;
    
    BOOL isNullData = NO;
    if (self.isSingleLists) {
        if (self.sourceListDict.count == 0) {
            isNullData = YES;
        }
    }
    if (!self.isSingleLists || (self.isSingleLists && isNullData)) {
        
        if ([self.delegate respondsToSelector:@selector(listsModel:newData:oldData:isFirstData:)]) {
            // 设置数据
            
            id oldData = [self dataWithIndex:index];
            data = [self.delegate listsModel:self newData:sourceData oldData:oldData isFirstData:isFirstData];
        }else {
            CGDebugAssert(NO, @"请实现listsModel:newData:oldData:isFirstData:代理方法实现添加/更新数据");
        }
    }else {
        
        data = [self _setupSingleLists:sourceData isFirstData:isFirstData didHandleNewData:&didHandleNewData];
    }
    
    if ([self dataWithIndex:index] != data) {
        [self setData:data forIndex:index];
    }
    
    // 设置当前数据状态
    YMSourceDataStatus status = YMSourceDataStatusLoading;
    if ([self.delegate respondsToSelector:@selector(listsModel:sourceStatusFordata:isFirstData:)]) {
        status = [self.delegate listsModel:self sourceStatusFordata:data isFirstData:isFirstData];
    }else {
        if (self.isSingleLists) {
            status = [self _statusWithAllData:data newData:didHandleNewData isFirstData:isFirstData];
        }
    }
    self.status = status;
}

- (id)dataWithIndex:(NSInteger)index
{
    NSNumber *key = @(index);
    return self.sourceListDict[key];
}

- (void)setData:(id)data forIndex:(NSInteger)index
{
    [self.sourceListDict setObject:data forKey:@(index)];
}

#pragma mark - 私有方法
- (NSArray *)_setupSingleLists:(id)newData isFirstData:(BOOL)isFirstData didHandleNewData:(NSArray **)didHandleNewData
{
    NSMutableArray *mutableArray = self.sourcelists;
    if (isFirstData) {
        [mutableArray removeAllObjects];
    }
    NSArray *tempDidHandleNewData = nil;
    if (newData != nil) {
        if (mutableArray == nil) {
            mutableArray = [NSMutableArray array];
            NSNumber *key = [self.sourceListDict.allKeys firstObject];
            if (key == nil) {
                key = @(0);
            }
            
            [self.sourceListDict setObject:mutableArray forKey:key];
        }
        
        if ([newData isKindOfClass:[NSArray class]]) {
            [mutableArray addObjectsFromArray:newData];
            tempDidHandleNewData = newData;
        }else {
            if ([self.delegate respondsToSelector:@selector(listsModel:handleNotListsData:isFirstData:)]) {
                NSArray *array = [self.delegate listsModel:self handleNotListsData:newData isFirstData:isFirstData];
                !array?: [mutableArray addObjectsFromArray:array];
                tempDidHandleNewData = array;
            }else {
                CGDebugAssert(NO, @"单列列表下设置的数据必须为数组, 需要实现listsModel:handleNotListsData:isFirstData:");
            }
        }
    }
    if (*didHandleNewData != NULL) {
        *didHandleNewData = tempDidHandleNewData;
    }
    
    return mutableArray;
}

- (YMSourceDataStatus)_statusWithAllData:(NSArray *)alldata newData:(NSArray *)newData isFirstData:(BOOL)isFirstData
{
    if (alldata.count == 0) {
        return YMSourceDataStatusIsEmpty;
    }
    
    if (self.pageSize > 0) {
        if (newData.count < self.pageSize) {
            return YMSourceDataStatusLoadEnd;
        }
    }else {
        if (isFirstData) {
            self.firstDataSize = newData.count;
        }else {
            if (newData.count < self.firstDataSize ) {
                return YMSourceDataStatusLoadEnd;
            }
        }
    }
    return YMSourceDataStatusLoading;
}

#pragma mark - 设置属性

- (NSMutableDictionary<NSNumber *,id> *)sourceListDict
{
    if (_sourceListDict) {
        return _sourceListDict;
    }
    
    _sourceListDict = [NSMutableDictionary dictionary];
    
    return _sourceListDict;
}

- (BOOL)isEmpty
{
    if (self.isSingleLists) {
        
        return self.sourcelists.count == 0;
    }
    return !self.sourceListDict.count;
}

- (BOOL)isSingleLists
{
    if (!_isSingleLists) {
        return NO;
    }
    if (self.sourceListDict.count <= 1) {
        NSArray *array = [self.sourceListDict.allValues firstObject];
        if ([array isKindOfClass:[NSArray class]]) {
            return YES;
        }else if (array == nil) {
            return YES;
        }
    }
    return NO;
}

- (NSMutableArray *)sourcelists
{
    if (!self.isSingleLists) {
        return nil;
    }
    
    NSArray *array = [self.sourceListDict.allValues firstObject];
        
    if ([array isKindOfClass:[NSMutableArray class]]) {
        return (NSMutableArray *)array;
    }else {
        if (array) {
            NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
            [self.sourceListDict setObject:mutableArray forKey:self.sourceListDict.allKeys.firstObject];
            return mutableArray;
        }
    }
    return nil;
}

- (NSArray *)allIndexs
{
    return [self.sourceListDict allKeys];
}

@end
