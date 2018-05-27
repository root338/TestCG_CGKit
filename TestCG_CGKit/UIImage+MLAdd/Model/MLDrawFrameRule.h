//
//  MLDrawFrameRule.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDrawBaseRule.h"
#import "MLFramePathProtocol.h"
#import "MLFrameAppearanceProtocol.h"

@interface MLDrawFrameRule : MLDrawBaseRule<MLFramePathProtocol, MLFrameAppearanceProtocol, NSCopying>

/// 边框的颜色
@property (nullable, nonatomic, strong) UIColor *lineColor;
/// 边框的宽度
@property (nonatomic, assign) CGFloat lineWidth;
/// 圆角的半径值
@property (nonatomic, assign) CGFloat cornerRadius;
/// 圆角的四周设置
@property (nonatomic, assign) UIRectCorner corners;

@end
