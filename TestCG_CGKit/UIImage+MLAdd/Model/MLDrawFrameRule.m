//
//  MLDrawFrameRule.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDrawFrameRule.h"

@implementation MLDrawFrameRule

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    MLDrawFrameRule *rule = [super copyWithZone:zone];
    rule.lineColor  = [self.lineColor copy];
    rule.lineWidth  = self.lineWidth;
    rule.cornerRadius   = self.cornerRadius;
    rule.corners        = self.corners;
    return rule;
}

@end
