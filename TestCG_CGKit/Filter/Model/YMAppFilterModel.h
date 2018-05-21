//
//  YMAppFilterModel.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/7.
//  Copyright © 2018年 ym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMAppFilterModelTypeHeader.h"

NS_ASSUME_NONNULL_BEGIN

/**
 app 筛选/排序的选项类型
 */
@interface YMAppFilterModel : NSObject<YMAppFilterModelProtocol>

@property (nonatomic, strong, readonly) NSString *code;

@property (nonatomic, strong, readonly) NSString *name;

@property (nullable, nonatomic, strong) id other;

- (instancetype)initWithCode:(NSString *)code name:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
