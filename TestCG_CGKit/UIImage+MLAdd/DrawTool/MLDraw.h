//
//  MLDraw.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MLDrawCanvasRule, MLDrawError;

@interface MLDraw : NSObject

@property (nonatomic, readonly) CGContextRef currentContext;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithRule:(id<MLDrawCanvasRule>)rule;

@end
NS_ASSUME_NONNULL_END
