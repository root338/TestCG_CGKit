//
//  UIImage+MLAdd.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/24.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MLDrawCornerRadiusConfig;

@interface UIImage (MLAdd)

+ (nullable UIImage *)ml_drawImageWithConfig:(MLDrawCornerRadiusConfig *)config;
    
@end

NS_ASSUME_NONNULL_END
