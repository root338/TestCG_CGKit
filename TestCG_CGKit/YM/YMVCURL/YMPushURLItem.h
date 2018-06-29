//
//  YMPushURLItem.h
//  QuickAskCommunity
//
//  Created by apple on 2018/6/28.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMPushURLDefineHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface YMPushURLItem : NSObject<NSCopying, NSMutableCopying>

@property (nonatomic, copy, readonly) YMAppPushURLScheme scheme;
@property (nonatomic, copy, readonly) YMAppPushURLHost host;
@property (nonatomic, copy, readonly) YMAppPushURLPath path;
@property (nonatomic, copy, readonly) YMAppPushURLModuleName moduleName;



@end

@interface YMMutablePushURLItem : YMPushURLItem

@property (nonatomic, copy) YMAppPushURLScheme scheme;
@property (nonatomic, copy) YMAppPushURLHost host;
@property (nonatomic, copy) YMAppPushURLPath path;
@property (nonatomic, copy) YMAppPushURLModuleName moduleName;

@end

NS_ASSUME_NONNULL_END
