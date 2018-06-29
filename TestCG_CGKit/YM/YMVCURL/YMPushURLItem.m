//
//  YMPushURLItem.m
//  QuickAskCommunity
//
//  Created by apple on 2018/6/28.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMPushURLItem.h"

@interface YMPushURLItem ()

@property (nonatomic, copy, readwrite) YMAppPushURLScheme scheme;
@property (nonatomic, copy, readwrite) YMAppPushURLHost host;
@property (nonatomic, copy, readwrite) YMAppPushURLPath path;
@property (nonatomic, copy, readwrite) YMAppPushURLModuleName moduleName;

@end

@implementation YMPushURLItem

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    typeof(self) item = [[[self class] allocWithZone:zone] init];
    [self _copyPropertyListToItem:item];
    return item;
}
#pragma mark - NSMutableCopying
- (id)mutableCopyWithZone:(NSZone *)zone {
    YMMutablePushURLItem *item = [[YMMutablePushURLItem allocWithZone:zone] init];
    [self _copyPropertyListToItem:item];
    return item;
}

#pragma mark - 私有方法
- (void)_copyPropertyListToItem:(YMPushURLItem *)item {
    item.scheme = self.scheme;
    item.host   = self.host;
    item.path   = self.path;
    item.moduleName = self.moduleName;
}

@end

@implementation YMMutablePushURLItem

@dynamic scheme;
@dynamic host;
@dynamic path;
@dynamic moduleName;

@end
