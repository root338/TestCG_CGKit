//
//  MLFramePathProtocol.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLBasePathProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MLFramePathProtocol <NSObject, MLBasePathProtocol>

@required
/// 边框的宽度
@property (nonatomic, assign, readonly) CGFloat lineWidth;
/// 圆角的半径值
@property (nonatomic, assign, readonly) CGFloat cornerRadius;
/// 圆角的四周设置
@property (nonatomic, assign, readonly) UIRectCorner corners;

@end

NS_ASSUME_NONNULL_END
