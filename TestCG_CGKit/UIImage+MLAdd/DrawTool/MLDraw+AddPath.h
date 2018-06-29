//
//  MLDraw+AddPath.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDraw.h"

@protocol MLDrawFilletRule;

NS_ASSUME_NONNULL_BEGIN

@interface MLDraw (AddPath)

+ (void)drawFilletWithRule:(id<MLDrawFilletRule>)rule context:(CGContextRef)context;

@end

NS_ASSUME_NONNULL_END
