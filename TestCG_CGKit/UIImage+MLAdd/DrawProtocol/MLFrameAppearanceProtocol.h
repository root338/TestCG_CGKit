//
//  MLFrameAppearanceProtocol.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MLFrameAppearanceProtocol <NSObject>

/// 边框的颜色
@property (nullable, nonatomic, strong, readonly) UIColor *lineColor;
/// 边框的宽度
@property (nonatomic, assign, readonly) CGFloat lineWidth;

@end
