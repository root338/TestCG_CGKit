//
//  MLDrawBaseRule.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLBasePathProtocol.h"

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface MLDrawBaseRule : NSObject<MLBasePathProtocol, NSCopying>

/// 绘制的大小
@property (nonatomic, assign) CGSize size;
/// 是否不透明, 默认 NO
@property (nonatomic, assign) BOOL opaque;
/// 1x,2x,3c 默认 [UIScreen mainScreen].scale;
@property (nonatomic, assign) CGFloat scale;
/// 画布的背景色
@property (nullable, nonatomic, copy) UIColor *backgroundColor;
/// 背景色图片
@property (nullable, nonatomic, copy) UIImage *backgroundImage;
/// 背景色图片填充的方式
@property (nonatomic, assign) UIViewContentMode backgroundContentMode;

@end

NS_ASSUME_NONNULL_END
