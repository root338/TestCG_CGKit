//
//  MLCellItemBucket.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLCellItemBucket.h"
#import "MLScrollCellItem.h"

@interface MLCellItemBucket ()
{
    NSMutableDictionary<NSValue *, NSMutableSet<MLScrollCellItem *> *> *_buckets;
}

@property (nonatomic, copy) NSValue * (^bucketKey) (NSInteger x, NSInteger y);
@end

@implementation MLCellItemBucket

@synthesize bucketSize = _bucketSize;

- (instancetype)initWithBucketSize:(CGSize)bucketSize
{
    if (self = [super init]) {
        _bucketSize = bucketSize;
        _buckets = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addCellItem:(MLScrollCellItem *)cellItem
{
    if (cellItem == nil || (cellItem.maxX <= cellItem.minX && cellItem.maxY <= cellItem.minY)) {
        return;
    }
    
    NSValue *cellItemKey = self.bucketKey((NSInteger)floor(cellItem.minX), (NSInteger)floor(cellItem.minY));

    NSMutableSet *cellItems = [_buckets objectForKey:cellItemKey];
    if (cellItems == nil) {
        cellItems = [NSMutableSet set];
        [_buckets setObject:cellItems forKey:cellItemKey];
    }
    [cellItems addObject:cellItem];
}

- (void)addCellItems:(NSSet<MLScrollCellItem *> *)cellItems
{
    for (MLScrollCellItem *cellItem in cellItems) {
        [self addCellItem:cellItem];
    }
}

- (void)removeCellItem:(MLScrollCellItem *)cellItem
{
    NSValue *key = self.bucketKey((NSInteger)floor(cellItem.minX), (NSInteger)(floor(cellItem.minY)));
    NSMutableSet *cellItems = _buckets[key];
    [cellItems removeObject:cellItem];
}

- (void)removeCellItems:(NSSet<MLScrollCellItem *> *)cellItems
{
    for (NSMutableSet *saveCellItems in _buckets.allValues) {
        [saveCellItems minusSet:cellItems];
    }
}

- (void)reloadCellItem:(MLScrollCellItem *)cellItem
{
    [self removeCellItem:cellItem];
    [self addCellItem:cellItem];
}

- (void)reloadCellItems:(NSSet<MLScrollCellItem *> *)cellItems
{
    [self removeCellItems:cellItems];
    [self addCellItems:cellItems];
}

- (void)clear
{
    [_buckets removeAllObjects];
}

- (NSSet<MLScrollCellItem *> *)showingCellItemsFrom:(CGRect)rect
{
    
    NSMutableSet<MLScrollCellItem *> * cellItems = [NSMutableSet set];
    
    NSSet * (^handleValue) (NSValue *) = ^(NSValue *value) {
        NSSet *resultValue = nil;
        CGPoint cellItemPoint = value.CGPointValue;
        if (CGRectContainsPoint(rect, cellItemPoint)) {
            resultValue = self->_buckets[value];
        }
        return resultValue;
    };
    
//    if (_buckets.count < 1000) {
        for (NSValue *key in _buckets.allKeys) {
            NSSet *value = handleValue(key);
            !value ?: [cellItems unionSet:value];
        }
//    }else {
//        dispatch_queue_t handleCellItemsQueue = dispatch_queue_create("com.ml.scrollView.cellItemBucket.showing", NULL);
//
//        NSArray<NSValue *> *cellItemPoints = _buckets.allKeys;
//        dispatch_apply(cellItemPoints.count, handleCellItemsQueue, ^(size_t index) {
//            NSSet *value = handleValue(cellItemPoints[index]);
//            dispatch_barrier_async(handleCellItemsQueue, ^{
//                [cellItems unionSet:value];
//            });
//        });
//    }
    
    return cellItems;
}

- (NSValue *(^)(NSInteger, NSInteger))bucketKey
{
    if (_bucketKey) {
        return _bucketKey;
    }
    
    _bucketKey = ^(NSInteger x, NSInteger y) {
        return [NSValue valueWithCGPoint:CGPointMake(x, y)];
    };
    
    return _bucketKey;
}
@end
