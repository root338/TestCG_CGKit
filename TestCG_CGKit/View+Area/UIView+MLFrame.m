//
//  UIView+MLFrame.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIView+MLFrame.h"

@implementation UIView (MLFrame)

#pragma mark - frame
@dynamic ml_x;
@dynamic ml_y;
@dynamic ml_width;
@dynamic ml_height;
@dynamic ml_size;
@dynamic ml_origin;

- (CGFloat)ml_x
{
    return self.frame.origin.x;
}

- (void)setMl_x:(CGFloat)ml_x
{
    if (self.frame.origin.x != ml_x) {
        CGRect frame = self.frame;
        frame.origin.x = ml_x;
        self.frame = frame;
    }
}

- (CGFloat)ml_y
{
    return self.frame.origin.y;
}

- (void)setMl_y:(CGFloat)ml_y
{
    if (self.frame.origin.y != ml_y) {
        CGRect frame = self.frame;
        frame.origin.y = ml_y;
        self.frame = frame;
    }
}

- (void)setMl_width:(CGFloat)ml_width
{
    if (self.frame.size.width != ml_width) {
        CGRect frame = self.frame;
        frame.size.width = ml_width;
        self.frame = frame;
    }
}

- (void)setMl_height:(CGFloat)ml_height
{
    if (self.frame.size.height != ml_height) {
        CGRect frame = self.frame;
        frame.size.height = ml_height;
        self.frame = frame;
    }
}

- (CGSize)ml_size
{
    return self.frame.size;
}

- (void)setMl_size:(CGSize)ml_size
{
    if (!CGSizeEqualToSize(self.frame.size, ml_size)) {
        CGRect frame = self.frame;
        frame.size = ml_size;
        self.frame = frame;
    }
}

- (CGPoint)ml_origin
{
    return self.frame.origin;
}

- (void)setMl_origin:(CGPoint)ml_origin
{
    if (!CGPointEqualToPoint(self.frame.origin, ml_origin)) {
        CGRect frame = self.frame;
        frame.origin = ml_origin;
        self.frame = frame;
    }
}

@end
