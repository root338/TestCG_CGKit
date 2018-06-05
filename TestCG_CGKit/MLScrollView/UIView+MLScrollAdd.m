//
//  UIView+MLScrollAdd.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIView+MLScrollAdd.h"

#import <objc/runtime.h>

@implementation UIView (MLScrollAdd)

- (instancetype)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [self initWithFrame:frame]) {
        self.mlReuseIdentifier = reuseIdentifier;
    }
    return self;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [self init]) {
        self.mlReuseIdentifier = reuseIdentifier;
    }
    return self;
}

#pragma mark - Properties

- (void)setMlIndexPath:(NSIndexPath *)indexPath
{
    objc_setAssociatedObject(self, @selector(setMlIndexPath:), indexPath, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSIndexPath *)mlIndexPath
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setMlReuseIdentifier:(NSString *)mlReuseIdentifier
{
    objc_setAssociatedObject(self, @selector(setMlReuseIdentifier:), mlReuseIdentifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)mlReuseIdentifier
{
    return objc_getAssociatedObject(self, _cmd);
}

@end
