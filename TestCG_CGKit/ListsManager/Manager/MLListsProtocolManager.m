//
//  YMTableViewProtocolManager.m
//  QuickAskCommunity
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "MLListsProtocolManager.h"

#import "YMCellProtocol.h"

@interface MLListsProtocolManager ()//<MLListsManagerProtocol>

@property (nonatomic, strong, readonly) NSArray *sourceDataArray;

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSNumber *> *cacheCellHeights;
@property (nonatomic, strong) NSMutableDictionary<NSString *, UITableViewCell *> *reusableCellsDict;

///// 源数据加载的状态
//@property (nonatomic, assign, readwrite) YMSourceDataStatus sourceDataStatus;
///// 页脚的处理方式
//@property (nonatomic, assign, readwrite) YMHandleRefreshFooterType handleFooterType;
///// 数据加载完后的处理方式
//@property (nonatomic, assign, readwrite) YMHandleLoadEndType handleLoadEndType;

@end

@implementation MLListsProtocolManager

#pragma mark - MLListsManagerProtocol

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
