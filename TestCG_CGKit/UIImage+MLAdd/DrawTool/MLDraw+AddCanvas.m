//
//  MLDraw+AddCanvas.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDraw+AddCanvas.h"

#import "MLDrawCanvasRule.h"

@implementation MLDraw (AddCanvas)

+ (void)generateCanvasWithRule:(id<MLDrawCanvasRule>)rule error:(MLDrawError *__autoreleasing  _Nullable *)error
{
    UIGraphicsBeginImageContextWithOptions(rule.canvasSize, rule.opaque, rule.scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (currentContext) {
        
        if (rule.backgroundColor) {
            [rule.backgroundColor setFill];
            CGContextAddRect(currentContext, CGRectMake(0, 0, rule.canvasSize.width, rule.canvasSize.height));
            CGContextDrawPath(currentContext, kCGPathFill);
        }
    }else {
        [self endCanvas];
    }
}

+ (void)endCanvas
{
    UIGraphicsEndImageContext();
}

@end
