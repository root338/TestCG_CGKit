//
//  YMFilterSortError.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/11.
//  Copyright © 2018年 ym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMFilterDefineHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface YMFilterSortError : NSObject
/// 错误类型
@property (nonatomic, assign) YMFilterSortErrorType errorType;

#pragma mark - 动画错误属性
/// 动画的样式
@property (nonatomic, assign) YMFilterAnimatedStyle animatedStyle;
/// 动画在哪执行
@property (nonatomic, assign) YMFilterAnimatedType animatedType;

@end

NS_ASSUME_NONNULL_END
