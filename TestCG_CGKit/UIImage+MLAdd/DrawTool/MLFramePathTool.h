//
//  MLFramePathTool.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLFramePathProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class MLDrawError;
@interface MLFramePathTool : NSObject

@property (nonatomic, assign, readonly) CGPathRef path;

/// 创建一个边框路径，需要自己释放
+ (nullable CGPathRef)createPathWithPathRule:(id<MLFramePathProtocol>)framePath error:( NSError * _Nullable *)error;

#pragma mark - 验证
+ (BOOL)verifyRuleIsAvailableWithError:(NSError * _Nullable *)error;

#pragma mark - 具体路径实现
- (nullable CGPathRef)pathRule:(id<MLFramePathProtocol>)rule error:( NSError * _Nullable *)error;

@end

NS_ASSUME_NONNULL_END
