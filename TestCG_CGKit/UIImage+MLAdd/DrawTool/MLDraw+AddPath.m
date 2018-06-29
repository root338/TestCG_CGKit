//
//  MLDraw+AddPath.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDraw+AddPath.h"
#import "MLDraw+CreatePath.h"

#import "MLDrawFilletRule.h"

@implementation MLDraw (AddPath)

+ (void)drawFilletWithRule:(id<MLDrawFilletRule>)rule context:(CGContextRef)context
{
    UIBezierPath *bezierPath = [MLDraw createFilletWithRule:rule];
    [bezierPath setLineWidth:rule.lineWidth * 2];
    if (rule.isClip) {
        [bezierPath addClip];
    }
    
    if (rule.lineStrokeColor) {
        [rule.lineStrokeColor setStroke];
        [bezierPath stroke];
    }
    if (rule.lineFillColor) {
        [rule.lineFillColor setFill];
        [bezierPath fill];
    }
    
    
}

@end
