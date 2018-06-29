//
//  MLScrollReusePool.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLScrollReusePool.h"

#import "UIView+MLScrollAdd.h"

@interface MLScrollReusePool ()
{
    
}
/// 因为NSCache没有保存存储的key值，所以单独创建一个属性来保存key值
@property (nonatomic, strong) NSMutableSet<NSString *> *reuseIdentifiers;
@property (nonatomic, strong) NSCache<NSString *, NSMutableSet<UIView *> *> *reusePoolCache;

@end

@implementation MLScrollReusePool

- (void)addItemView:(UIView *)itemView forReuseIdentifier:(NSString *)reuseIdentifier
{
    if (itemView == nil || reuseIdentifier.length == 0) {
        return;
    }
    NSMutableSet *viewSet = [self.reusePoolCache objectForKey:reuseIdentifier];
    if (viewSet == nil) {
        viewSet = [NSMutableSet set];
        [self.reuseIdentifiers addObject:reuseIdentifier];
        [self.reusePoolCache setObject:viewSet forKey:reuseIdentifier];
    }
    [viewSet addObject:itemView];
}

- (UIView *)dequeueItemViewForReuseIdentifier:(NSString *)reuseIdentifier
{
    return [self dequeueItemViewForReuseIdentifier:reuseIdentifier andIndexPath:nil];
}

- (UIView *)dequeueItemViewForReuseIdentifier:(NSString *)reuseIdentifier andIndexPath:(nullable NSIndexPath *)indexPath
{
    if (reuseIdentifier.length == 0) {
        return nil;
    }
    NSMutableSet<UIView *> *viewSet = [self.reusePoolCache objectForKey:reuseIdentifier];
    if (viewSet.count == 0) {
        return nil;
    }
    
    UIView *reuseView = nil;
    if (indexPath == nil) {
        reuseView = [viewSet anyObject];
    }else {
        for (UIView *view in viewSet) {
            if ([view.mlIndexPath compare:indexPath] == NSOrderedSame) {
                reuseView = view;
                break;
            }
        }
    }
    
    if (reuseView) {
        [viewSet removeObject:reuseView];
    }
    return reuseView;
}

- (void)clear
{
    [_reuseIdentifiers removeAllObjects];
    [_reusePoolCache removeAllObjects];
}

- (NSSet<UIView *> *)allItemViews
{
    if (_reuseIdentifiers == nil || _reusePoolCache == nil) {
        return nil;
    }
    NSMutableSet *allItemViews = [NSMutableSet set];
    for (NSString * reuseIdentifier in _reuseIdentifiers) {
        NSSet *itemViews = [_reusePoolCache objectForKey:reuseIdentifier];
        if (itemViews.count > 0) {
            [allItemViews unionSet:itemViews];
        }
    }
    return allItemViews;
}

#pragma mark - Properties

- (NSCache<NSString *,NSMutableSet<UIView *> *> *)reusePoolCache
{
    if (_reusePoolCache == nil) {
        _reusePoolCache = [[NSCache alloc] init];
    }
    return _reusePoolCache;
}

- (NSMutableSet<NSString *> *)reuseIdentifiers
{
    if (_reuseIdentifiers == nil) {
        _reuseIdentifiers = [NSMutableSet set];
    }
    return _reuseIdentifiers;
}

@end
