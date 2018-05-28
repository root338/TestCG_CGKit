//
//  MLListsScrollProtocolManager.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLListsProtocolManager.h"

@interface MLListsScrollProtocolManager<__covariant delegateType, __covariant ObjectType> : MLListsProtocolManager<MLListsScrollManagerProtocol>

/// 滑动的速度 点/s
@property (nonatomic, assign, readonly) CGFloat scrollRate;
/// 当速度大于或等于指定值时停止配置 cell, (取绝对值)
@property (nonatomic, assign) CGFloat greaterThanOrEqualScrollRateStopConfigureCell;
/// 当速度大于或等于指定值时停止配置 cellHeight (取绝对值)
@property (nonatomic, assign) CGFloat greaterThanOrEqualScrollRateStopConfigureCellHeight;


@end
