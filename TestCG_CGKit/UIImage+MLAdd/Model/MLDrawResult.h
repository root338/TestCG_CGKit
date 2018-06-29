//
//  MLDrawResult.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MLDrawError;
@interface MLDrawResult : NSObject

@property (nullable, nonatomic, strong) UIImage *resultImage;

@property (nullable, nonatomic, strong) MLDrawError *error;

- (instancetype)initWithImage:(UIImage *)image;
- (instancetype)initWithError:(MLDrawError *)error;

@end

NS_ASSUME_NONNULL_END
