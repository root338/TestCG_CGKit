//
//  UIView+MLCreate.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIView+MLCreate.h"

@implementation UIView (MLCreate)

@dynamic ml_frame;
@dynamic ml_backgroundColor;
@dynamic ml_userInteractionEnabled;

@dynamic ml_borderColor;
@dynamic ml_borderWidth;
@dynamic ml_cornerRadius;

#pragma mark - MLCreateViewProtocol
+ (__kindof UIView *  _Nonnull (^)(void))create {
    return ^{
        return [[self alloc] init];
    };
}

- (__kindof UIView *  _Nonnull (^)(CGRect))ml_frame {
    return ^(CGRect frame){
        if (!CGRectEqualToRect(frame, self.frame)) {
            self.frame = frame;
        }
        return self;
    };
}

- (__kindof UIView *  _Nonnull (^)(UIColor * _Nonnull))ml_backgroundColor {
    return ^(UIColor *backgroundColor) {
        if (backgroundColor != self.backgroundColor) {
            self.backgroundColor = backgroundColor;
        }
        return self;
    };
}

- (UIView * _Nonnull (^)(BOOL))ml_userInteractionEnabled {
    return ^(BOOL userInteractionEnabled) {
        if (self.userInteractionEnabled != userInteractionEnabled) {
            self.userInteractionEnabled = userInteractionEnabled;
        }
        return self;
    };
}

- (UIView * _Nonnull (^)(CGFloat))ml_borderWidth {
    return ^(CGFloat borderWidth) {
        if (self.layer.borderWidth != borderWidth) {
            self.layer.borderWidth = borderWidth;
        }
        return self;
    };
}

- (UIView * _Nonnull (^)(UIColor * _Nonnull))ml_borderColor {
    return ^(UIColor *borderColor) {
        if (borderColor.CGColor != self.layer.borderColor) {
            self.layer.borderColor = borderColor.CGColor;
        }
        return self;
    };
}

- (UIView * _Nonnull (^)(CGFloat))ml_cornerRadius {
    return ^(CGFloat cornerRadius) {
        if (cornerRadius != self.layer.cornerRadius) {
            self.layer.cornerRadius = cornerRadius;
        }
        return self;
    };
}

@end
