//
//  YMTableViewProtocolManager.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "MLListsBaseProtocolManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLListsProtocolManager<__covariant delegateType, __covariant ObjectType> : MLListsBaseProtocolManager

@property (nullable, nonatomic, weak) UIViewController *sender;
 
@property (nonatomic, assign) CGFloat estimatedRowHeight;

@property (nullable, nonatomic, strong) UITableViewCell *cacheCell;

@property (nullable, nonatomic, copy) CGFloat (^configureCellHeightBlock) (__kindof UITableViewCell * cell, ObjectType data);

@end
NS_ASSUME_NONNULL_END
