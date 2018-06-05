//
//  MLDrawFilletRule.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDrawFilletRule.h"

@interface MLDrawFilletRule ()
{
    BOOL _userSettingMark;
}

@end

@implementation MLDrawFilletRule

@synthesize isClip = _isClip;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _rectCorner = UIRectCornerAllCorners;
    }
    return self;
}

- (BOOL)isClip
{
    if (_userSettingMark) {
        return _isClip;
    }else {
        if (self.cornerRadius > 0) {
            return YES;
        }else {
            return NO;
        }
    }
}

- (void)setIsClip:(BOOL)isClip
{
    _isClip = isClip;
    _userSettingMark = YES;
}

@end
