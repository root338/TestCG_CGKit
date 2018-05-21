//
//  MLListsSourceDataModel.m
//  TestCG_CGKit
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLListsSourceData.h"

typedef void (^_MLHandleListsDataBlock)(NSInteger page, id obj, NSInteger index);

/**
 添加分页列表的处理类型
 
 - _MLHandlePageListsTypeAdd: 添加
 - _MLHandlePageListsTypeReplace: 替换
 - _MLHandlePageListsTypeRemove: 移除
 */
typedef NS_ENUM(NSInteger, _MLHandlePageListsType) {
    _MLHandlePageListsTypeAdd,
    _MLHandlePageListsTypeReplace,
    _MLHandlePageListsTypeRemove,
};

@interface MLListsSourceData ()

@property (nonatomic, assign, readwrite) NSInteger totalCount;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *pages;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSArray *> *listsSourceDict;

@end

@implementation MLListsSourceData

@synthesize totalCount = _totalCount;

- (void)addPageList:(NSArray *)pageList page:(NSInteger)page
{
    [self _handlePageList:pageList page:page type:_MLHandlePageListsTypeAdd];
}

- (NSArray *)listWithPage:(NSInteger)page
{
    return self.listsSourceDict[@(page)];
}

- (void)objectWithIndex:(NSInteger)index modelBlock:(void (^)(NSInteger, id _Nullable))modelBlock
{
    if (!modelBlock) {
        return;
    }
    
    [self _searchWithModel:nil index:index modelBlock:^(NSInteger page, id obj, NSInteger index) {
        modelBlock(page, obj);
    }];
}

- (NSArray *)removeListWithPage:(NSInteger)page
{
    return [self _handlePageList:nil page:page type:_MLHandlePageListsTypeRemove];
}

- (NSArray *)removePageList:(NSArray *)list
{
    return [self _handlePageList:list page:-1 type:_MLHandlePageListsTypeRemove];
}

- (BOOL)removeWithIndex:(NSInteger)index modelBlock:(void (^ _Nullable)(NSInteger, id _Nullable))modelBlock
{
    return [self _removeWithModel:nil index:index modelBlock:^(NSInteger page, id obj, NSInteger index) {
        if (modelBlock) {
            modelBlock(page, obj);
        }
    }];
}

- (BOOL)removeWithObj:(nonnull id)obj modelBlock:(void (^ _Nullable)(NSInteger, id _Nullable))modelBlock
{
    return [self _removeWithModel:obj index:0 modelBlock:^(NSInteger page, id obj, NSInteger index) {
        if (modelBlock) {
            modelBlock(page, obj);
        }
    }];
}

- (void)removeAllPageList
{
    [self.listsSourceDict removeAllObjects];
    [self.pages removeAllObjects];
}

#pragma mark - 私有
- (void)_searchWithModel:(id)model index:(NSInteger)index modelBlock:(_MLHandleListsDataBlock)modelBlock
{
    __block id tmpModel = model;
    __block NSInteger listIndex = index;
    __block NSInteger page = 0;
    __block NSInteger targetListIndex = 0;
    [self.listsSourceDict enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSArray * _Nonnull obj, BOOL * _Nonnull stop) {
        BOOL flag = NO;
        
        if (tmpModel) {
            if ([obj containsObject:tmpModel]) {
                targetListIndex = [obj indexOfObject:tmpModel];
                flag = YES;
            }
        }else {
            if (obj.count > listIndex) {
                
                targetListIndex = listIndex;
                tmpModel = obj[listIndex];
                
                flag = YES;
            }else {
                listIndex -= obj.count;
            }
        }
        
        if (flag) {
            page = key.integerValue;
            *stop = YES;
        }
    }];
    
    modelBlock(page, tmpModel, targetListIndex);
}

- (BOOL)_removeWithModel:(id)model index:(NSInteger)index modelBlock:(_MLHandleListsDataBlock)modelBlock
{
    __block BOOL resultValue = NO;
    __weak __block typeof(self) weakself = self;
    [self _searchWithModel:model index:index modelBlock:^(NSInteger page, id obj, NSInteger index) {
        
        if (obj) {
            NSMutableArray *pageList = [NSMutableArray arrayWithArray:weakself.listsSourceDict[@(page)]];
            [pageList removeObject:obj];
            [weakself _handlePageList:pageList page:page type:_MLHandlePageListsTypeReplace];
            resultValue = YES;
        }
    }];
    
    return resultValue;
}

- (NSArray *)_handlePageList:(NSArray *)pageList page:(NSInteger)page type:(_MLHandlePageListsType)type
{
    NSNumber *key = @(page);
    
    NSArray *oldPageList = nil;
    
    if (_MLHandlePageListsTypeRemove == type) {
        if (pageList == nil) {
            if ([self.pages containsObject:key]) {
                oldPageList = [self.listsSourceDict objectForKey:key];
            }
        }else {
            __block NSArray *tmpPageList = nil;
            if ([self.listsSourceDict.allValues containsObject:pageList]) {
                [self.listsSourceDict enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSArray * _Nonnull obj, BOOL * _Nonnull stop) {
                    if (obj == pageList) {
                        tmpPageList = obj;
                        *stop = YES;
                    }
                }];
            }
            pageList = tmpPageList;
        }
    }
    
    if (_MLHandlePageListsTypeRemove == type || _MLHandlePageListsTypeReplace == type) {
        if (oldPageList) {
            
            if (_MLHandlePageListsTypeRemove == type) {
                [self.pages removeObject:key];
            }
            
            [self.listsSourceDict removeObjectForKey:key];
            self.totalCount -= oldPageList.count;
        }
    }
    
    if (_MLHandlePageListsTypeReplace == type || _MLHandlePageListsTypeAdd == type) {
        
        if (pageList == nil) {
            [self.pages removeObject:key];
            [self.listsSourceDict removeObjectForKey:key];
        }else {
            
            [self.listsSourceDict setObject:pageList forKey:key];
            self.totalCount += pageList.count;
        }
    }
    
    if (_MLHandlePageListsTypeAdd == type) {
        
        if (![self.pages containsObject:key]) {
            
            [self.pages addObject:key];
            [self.pages sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                NSInteger page1 = [obj1 integerValue];
                NSInteger page2 = [obj2 integerValue];
                if (page1 > page2) {
                    return NSOrderedAscending;
                }else {
                    return NSOrderedDescending;
                }
            }];
        }
    }
    
    if (_MLHandlePageListsTypeRemove == type) {
        return oldPageList;
    }else {
        return pageList;
    }
}

#pragma mark - Properties

- (BOOL)isEmpty
{
    return self.totalCount > 0;
}

- (NSMutableDictionary<NSNumber *,NSArray *> *)listsSourceDict
{
    if (_listsSourceDict) {
        return _listsSourceDict;
    }
    
    _listsSourceDict = [NSMutableDictionary dictionaryWithCapacity:1];
    
    return _listsSourceDict;
}

- (NSMutableArray<NSNumber *> *)pages
{
    if (_pages) {
        return _pages;
    }
    
    _pages = [NSMutableArray arrayWithCapacity:1];
    
    return _pages;
}

@end
