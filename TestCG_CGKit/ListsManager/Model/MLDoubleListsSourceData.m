//
//  MLDoubleListsSourceDataModel.m
//  TestCG_CGKit
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDoubleListsSourceData.h"

@interface MLDoubleListsSourceData ()

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, MLListsSourceDataItem *> *listsSourceDataDict;

@end

@implementation MLDoubleListsSourceData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _pageSize = -1;
        _addFirstPageRemoveIndexAllData = YES;
    }
    return self;
}

- (void)addPageList:(NSArray *)pageList page:(NSInteger)page index:(NSInteger)index
{
    NSNumber *key = @(index);
    MLListsSourceDataItem *item = self.listsSourceDataDict[key];
    if (item == nil) {
        item = [[MLListsSourceDataItem alloc] init];
        if (!self.pageSizeDynamicChange) {
            NSInteger pageSize = -1;
            if ([self.delegate respondsToSelector:@selector(pageSizeWithIndex:)]) {
                pageSize = [self.delegate pageSizeWithIndex:index];
            }else if (self.pageSize > -1) {
                pageSize = self.pageSize;
            }
            item.pageSize = pageSize;
        }
        
        self.listsSourceDataDict[key] = item;
    }
    
    if (self.addFirstPageRemoveIndexAllData && page == 1) {
        [item.listsSourceData removeAllPageList];
    }
    
    [item.listsSourceData addPageList:pageList page:page];
    if ([self.delegate respondsToSelector:@selector(listsModel:statusWithIndex:)]) {
        item.status = [self.delegate listsModel:self statusWithIndex:index];
    }
}

- (MLListsSourceDataItem *)itemWithIndex:(NSInteger)index
{
    return self.listsSourceDataDict[@(index)];
}

- (MLListsSourceDataItem *)removeWithIndex:(NSInteger)index
{
    NSNumber *key = @(index);
    MLListsSourceDataItem *item = self.listsSourceDataDict[key];
    [self.listsSourceDataDict removeObjectForKey:key];
    return item;
}

#pragma mark - Properties

- (BOOL)isEmpty
{
    __block BOOL isEmpty = YES;
    [self.listsSourceDataDict enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, MLListsSourceDataItem * _Nonnull obj, BOOL * _Nonnull stop) {
        isEmpty = obj.listsSourceData.isEmpty;
        if (!isEmpty) {
            *stop = YES;
        }
    }];
    return isEmpty;
}

- (NSInteger)totalIndex
{
    return self.listsSourceDataDict.count;
}

- (NSArray<NSNumber *> *)allIndexs
{
    return self.listsSourceDataDict.allKeys;
}

- (NSMutableDictionary<NSNumber *,MLListsSourceDataItem *> *)listsSourceDataDict
{
    if (_listsSourceDataDict) {
        return _listsSourceDataDict;
    }
    
    _listsSourceDataDict = [NSMutableDictionary dictionary];
    
    return _listsSourceDataDict;
}

@end
