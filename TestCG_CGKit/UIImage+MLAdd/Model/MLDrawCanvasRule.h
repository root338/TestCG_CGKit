//
//  MLDrawCanvasRule.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MLDrawCanvasRule <NSObject>

@required
@property (nonatomic, assign, readonly) CGSize canvasSize;
/// 是否不透明, 默认 YES
@property (nonatomic, assign, readonly) BOOL opaque;
/// 1x,2x,3c 默认 [UIScreen mainScreen].scale;
@property (nonatomic, assign, readonly) CGFloat scale;
/// 画布的背景色
@property (nullable, nonatomic, copy, readonly) UIColor *backgroundColor;

@end

@interface MLDrawCanvasRule : NSObject<MLDrawCanvasRule>
/// 画布大小
@property (nonatomic, assign) CGSize canvasSize;
/// 是否不透明, 默认 YES
@property (nonatomic, assign) BOOL opaque;
/// 1x,2x,3x 默认 [UIScreen mainScreen].scale;
@property (nonatomic, assign) CGFloat scale;
/// 画布的背景色
@property (nullable, nonatomic, copy) UIColor *backgroundColor;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)initWithCanvasSize:(CGSize)canvasSize;

@end

NS_ASSUME_NONNULL_END
