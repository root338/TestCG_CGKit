//
//  YMTableViewProtocolManager.m
//  QuickAskCommunity
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "MLListsProtocolManager.h"

#import "YMCellProtocol.h"

#import "CGPrintLogHeader.h"

@interface MLListsProtocolManager ()<MLListsManagerProtocol>

@property (nonatomic, strong, readonly) NSArray *sourceDataArray;

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *cacheCellHeights;
@property (nonatomic, strong) NSMutableDictionary<NSString *, UITableViewCell *> *reusableCellsDict;

@end

@implementation MLListsProtocolManager

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key   = [NSString stringWithFormat:@"{%li,%li}", (long)indexPath.section, (long)indexPath.row];
    NSNumber *value = self.cacheCellHeights[key];
    
    if (value) {
        return value.floatValue;
    }
    
    CGFloat height  = 0;
    
    if ([self.delegate respondsToSelector:@selector(manage:tableView:heightForRowAtIndexPath:)]) {
        height = [self.delegate manage:self tableView:tableView heightForRowAtIndexPath:indexPath];
    }else {
        
        UITableViewCell *cell = nil;
        if ([self.delegate respondsToSelector:@selector(manage:tableView:calculateHeightCellWithIndexPath:)]) {
            cell = [self.delegate manage:self tableView:tableView calculateHeightCellWithIndexPath:indexPath];
        }else {
            cell = self.cacheCell;
        }
        
        CGDebugAssert(cell && _configureCellHeightBlock, @"需要设置 cell 或 _configureCellHeightBlock 值");
        
        height = self.configureCellHeightBlock(cell, [self objectAtIndex:indexPath.row forListIndex:indexPath.section]);
    }
    
    self.cacheCellHeights[key] = @(height);
    
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(manage:tableView:didSelectRowAtIndexPath:)]) {
        [self.delegate manage:self tableView:tableView didSelectRowAtIndexPath:indexPath];
    }else if ([self respondsToSelector:@selector(ml_tableView:didSelectRowAtIndexPath:)]) {
        [(id)self ml_tableView:tableView didSelectRowAtIndexPath:indexPath];
    }else {
        CGDebugAssert(nil, @"请实现delegate 代理的manage:tableView:didSelectRowAtIndexPath:,或自身实现ml_tableView:didSelectRowAtIndexPath:方法，来处理tableView的点击回调");
    }
}

#pragma mark - Properties

- (NSMutableDictionary<NSString *,NSNumber *> *)cacheCellHeights
{
    if (_cacheCellHeights) {
        return _cacheCellHeights;
    }

    _cacheCellHeights = [NSMutableDictionary dictionary];

    return _cacheCellHeights;
}

@end
