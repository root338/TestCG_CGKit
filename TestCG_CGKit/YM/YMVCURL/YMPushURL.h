//
//  YMPushURL.h
//  QuickAskCommunity
//
//  Created by apple on 2018/6/6.
//  Copyright © 2018年 ym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMPushVCPathHeader.h"

NS_ASSUME_NONNULL_BEGIN
/// 支持的协议
UIKIT_EXTERN YMAppPushURLScheme const YMPushURLScheme;
/// 支持的主机名
UIKIT_EXTERN YMAppPushURLHost const YMPushURLMainHost;

@interface YMPushURL : NSObject

@property (nonatomic, class, readonly) NSString *baseMainURL;
//@property (nonatomic, class, readonly) NSURL * (^targetURL) (YMAppPushURLPath targetPath, NSDictionary<NSString *, NSString *> * _Nullable parameters);
/// 创建指定路径URL，追加默认hostURL (baseMainURL)
@property (nonatomic, class, readonly) NSURL * (^targetURL) (YMAppPushURLPath targetPath);


+ (nullable NSURL *)createPushURLWithPath:(YMAppPushURLPath)path parameters:(nullable NSDictionary<NSString *, NSString *> *)parameters;

@end

NS_ASSUME_NONNULL_END
