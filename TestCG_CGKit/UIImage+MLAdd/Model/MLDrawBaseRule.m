//
//  MLDrawBaseRule.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDrawBaseRule.h"

@implementation MLDrawBaseRule

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _opaque = NO;
        _scale  = [UIScreen mainScreen].scale;
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    MLDrawBaseRule *rule = [[[self class] alloc] init];
    rule.size   = self.size;
    rule.opaque = self.opaque;
    rule.scale  = self.scale;
    rule.backgroundColor    = [self.backgroundColor copy];
    rule.backgroundImage    = [self.backgroundImage copy];
    rule.backgroundContentMode  = self.backgroundContentMode;
    return rule;
}

@end
