//
//  UIView+MLAdd.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIView+MLAdd.h"

@implementation UIView (MLAdd)

#pragma mark - 设置
- (void)setAllSubviewsBackgroundColor:(UIColor *)backgroundColor
{
    if (![self.backgroundColor isEqual:backgroundColor]) {
        self.backgroundColor = backgroundColor;
    }
    for (UIView *subview in self.subviews) {
        [subview setAllSubviewsBackgroundColor:backgroundColor];
    }
}

#pragma mark - 视图操作
- (void)ml_removeAllSubviews
{
    NSArray<UIView *> *subviews = self.subviews;
    if (subviews.count == 0) {
        return;
    }
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }
}

@end
