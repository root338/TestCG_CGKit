//
//  MLDrawCanvasRule.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDrawCanvasRule.h"

@implementation MLDrawCanvasRule

- (instancetype)initWithCanvasSize:(CGSize)canvasSize
{
    self = [super init];
    if (self) {
        
        _opaque = YES;
        _scale  = [UIScreen mainScreen].scale;
        _canvasSize = canvasSize;
    }
    return self;
}

@end
