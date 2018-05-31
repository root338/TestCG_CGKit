//
//  UIButton+MLCreate.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIButton+MLCreate.h"

#import "UIView+MLCreate.h"

@implementation UIButton (MLCreate)

@dynamic ml_enabled;

#pragma mark - MLCreateButtonProtocol

+ (UIView * _Nonnull (^)(UIButtonType))ml_button {
    return ^(UIButtonType buttonType) {
        return [self buttonWithType:buttonType];
    };
}

- (UIView * _Nonnull (^)(BOOL))ml_enabled {
    return ^(BOOL enable) {
        if (self.isEnabled != enable) {
            self.enabled = enable;
        }
        return self;
    };
}

@end
