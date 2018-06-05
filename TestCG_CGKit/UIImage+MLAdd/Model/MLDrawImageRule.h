//
//  MLDrawImageRule.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MLDrawImageRule <NSObject>

@required
/// 图片
@property (nullable, nonatomic, copy, readonly) UIImage *backgroundImage;
/// 图片填充的方式
@property (nonatomic, assign, readonly) UIViewContentMode backgroundImageContentMode;

@end

@interface MLDrawImageRule : NSObject<MLDrawImageRule>

/// 图片
@property (nullable, nonatomic, copy) UIImage *backgroundImage;
/// 图片填充的方式
@property (nonatomic, assign) UIViewContentMode backgroundImageContentMode;

@end

NS_ASSUME_NONNULL_END
