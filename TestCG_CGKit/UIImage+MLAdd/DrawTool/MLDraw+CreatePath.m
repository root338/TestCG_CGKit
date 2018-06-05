//
//  MLDraw+CreatePath.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDraw+CreatePath.h"
#import "MLDrawFilletRule.h"

@implementation MLDraw (CreatePath)

+ (UIBezierPath *)createFilletWithRule:(id<MLDrawFilletRule>)rule
{
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rule.filletRect byRoundingCorners:rule.rectCorner cornerRadii:CGSizeMake(rule.cornerRadius, rule.cornerRadius)];
    return bezierPath;
}

@end
