//
//  YMDiaryPostsBaseLayout.m
//  TestCG_CGKit
//
//  Created by apple on 2018/5/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YMDiaryPostsBaseLayout.h"

@interface YMDiaryPostsBaseLayout ()

@property (nonatomic, assign, readwrite) CGFloat opaque;
@property (nonatomic, assign, readwrite) CGFloat scale;
/// 画布大小
@property (nonatomic, assign, readwrite) CGSize drawSize;
/// 边距
@property (nonatomic, assign, readwrite) UIEdgeInsets insets;

@end

@implementation YMDiaryPostsBaseLayout

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
    YMDiaryPostsBaseLayout *cellLayout = [[[self class] alloc] init];
    cellLayout.opaque           = self.opaque;
    cellLayout.scale            = self.scale;
    cellLayout.drawSize         = self.drawSize;
    cellLayout.insets           = self.insets;
    
    return cellLayout;
}

@end

