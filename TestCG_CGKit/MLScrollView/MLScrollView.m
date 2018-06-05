//
//  MLScrollView.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLScrollView.h"
#import "MLScrollReusePool.h"

@interface MLScrollView ()
{
    /// 共有多少个cell
    NSInteger _cellItemTotalCount;
    /// cell 的布局缓存池
    MLScrollReusePool *_reuseCellItemsPool;
    
    /// 当前可用的cell item
    NSMutableSet<MLScrollCellItem *> *_visibleCellItems;
    /// 当前新的可用cell items
    NSMutableSet<MLScrollCellItem *> *_newVisibleCellItems;
    
    /// 当前可视的区域
    CGRect _visibleRectArea;
    /// 新的可视区域
    CGRect _newVisibleRectArea;
}


@end

@implementation MLScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _cellItemTotalCount = 0;
        _reuseCellItemsPool = [[MLScrollReusePool alloc] init];
        _visibleCellItems   = [NSMutableSet set];
        
    }
    return self;
}

- (void)storeCellItemsFromIndex:(NSInteger)index isReload:(BOOL)isReload
{
    if (index == 0) {
        _cellItemTotalCount = 0;
        [_reuseCellItemsPool clear];
    }
    if (self.dataSource) {
        _cellItemTotalCount = [self.dataSource numberOfItemsInScrollView:self];
        
    }
}

/// 获取可用的区域
- (void)visibleRectArea:(BOOL)isReload
{
    CGRect visibleRect = (CGRect){self.contentOffset, self.bounds.size};
    _newVisibleRectArea = visibleRect;
}

- (void)isReload:(BOOL)reload visibleRect:(CGRect)visibleRect
{
    
}

- (void)reloadData
{
    BOOL isReload   = YES;
//    [self storeCellItemsFromIndex:0 isReload:isReload];
    [self visibleRectArea:YES];
    [self isReload:isReload visibleRect:_newVisibleRectArea];
    
}

- (void)setContentOffset:(CGPoint)contentOffset
{
    if (!CGPointEqualToPoint(self.contentOffset, contentOffset)) {
        
    }
}

@end
