//
//  MLDrawResult.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDrawResult.h"

@implementation MLDrawResult

- (instancetype)initWithError:(MLDrawError *)error
{
    if (self = [super init]) {
        _error = error;
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
{
    if (self = [super init]) {
        _resultImage = image;
    }
    return self;
}

@end
