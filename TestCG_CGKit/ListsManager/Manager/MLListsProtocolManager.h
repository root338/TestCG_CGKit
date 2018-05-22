//
//  YMTableViewProtocolManager.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "MLListsBaseProtocolManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLListsProtocolManager : MLListsBaseProtocolManager

/// cell高度计算增量的偏移量，如：在cell有低线的状态下需要设置为 1
@property (nonatomic, assign) CGFloat cellHeightAddOffsetValue;

@property (nullable, nonatomic, weak) UIViewController *sender;
 
@property (nonatomic, assign) CGFloat estimatedRowHeight;

@end
NS_ASSUME_NONNULL_END
