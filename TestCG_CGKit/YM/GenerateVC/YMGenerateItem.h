//
//  YMGenerateItem.h
//  QuickAskCommunity
//
//  Created by apple on 2018/6/14.
//  Copyright © 2018年 ym. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YMGenerateItem : NSObject

@property (nonatomic, strong, readonly) NSURL * targetURL;

@property (nullable, nonatomic, strong) NSDictionary<NSString *, id> *parameters;

- (instancetype)initWithTargetURL:(NSURL *)targetURL;

@end
NS_ASSUME_NONNULL_END
