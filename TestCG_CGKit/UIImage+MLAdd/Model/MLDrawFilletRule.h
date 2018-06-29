//
//  MLDrawFilletRule.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MLDrawFilletRule <NSObject>

@required
@property (nonatomic, assign, readonly) CGRect filletRect;
@property (nonatomic, assign, readonly) CGFloat cornerRadius;
@property (nonatomic, assign, readonly) CGFloat lineWidth;
@property (nonatomic, strong, readonly) UIColor *lineStrokeColor;
@property (nonatomic, strong, readonly) UIColor *lineFillColor;
/// 圆角的四周设置
@property (nonatomic, assign, readonly) UIRectCorner rectCorner;
/// 是否剪裁外边区域，默认情况下,有圆角时剪裁
@property (nonatomic, assign, readonly) BOOL isClip;
@end

@interface MLDrawFilletRule : NSObject<MLDrawFilletRule>

@property (nonatomic, assign) CGRect filletRect;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *lineStrokeColor;
@property (nonatomic, strong) UIColor *lineFillColor;
/// 圆角的四周设置, 默认 UIRectCornerAllCorners
@property (nonatomic, assign) UIRectCorner rectCorner;
/// 是否剪裁外边区域，默认情况下,有圆角时剪裁
@property (nonatomic, assign) BOOL isClip;
@end

NS_ASSUME_NONNULL_END
