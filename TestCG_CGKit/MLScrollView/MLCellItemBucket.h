//
//  MLCellItemBucket.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MLScrollCellItem;
@interface MLCellItemBucket : NSObject

@property (nonatomic, assign, readonly) CGSize bucketSize;

- (id)init NS_UNAVAILABLE;
+ (id)new NS_UNAVAILABLE;
- (instancetype)initWithBucketSize:(CGSize)bucketSize NS_DESIGNATED_INITIALIZER;

- (void)addCellItem:(MLScrollCellItem *)cellItem;
- (void)addCellItems:(NSSet<MLScrollCellItem *> *)cellItems;
- (void)removeCellItem:(MLScrollCellItem *)cellItem;
- (void)removeCellItems:(NSSet<MLScrollCellItem *> *)cellItems;
- (void)reloadCellItem:(MLScrollCellItem *)cellItem;
- (void)reloadCellItems:(NSSet<MLScrollCellItem *> *)cellItems;
- (void)clear;

- (NSSet<MLScrollCellItem *> *)showingCellItemsFrom:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
