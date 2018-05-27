//
//  YMDiaryPostsCellLayout.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YMDiaryPostsCellLayout.h"

@interface YMDiaryPostsCellLayout ()

@property (nonatomic, assign, readwrite) CGFloat opaque;
@property (nonatomic, assign, readwrite) CGFloat scale;
/// 画布大小
@property (nonatomic, assign, readwrite) CGSize drawSize;
/// 边距
@property (nonatomic, assign, readwrite) UIEdgeInsets insets;
/// 标题的显示区域
@property (nonatomic, assign, readwrite) CGRect titleRect;
/// 内容的显示区域
@property (nonatomic, assign, readwrite) CGRect contentTextRect;
/// 图片的总共显示区域
@property (nonatomic, assign, readwrite) CGRect imagesTotalRect;
/// 图片的个数
@property (nonatomic, assign, readwrite) NSUInteger imageTotalCount;
/// 图片显示区域的数组
@property (nonatomic, strong, readwrite) NSArray<NSValue *> *imageRectValues;
/// 图片圆角
@property (nonatomic, assign, readwrite) CGFloat imageCornerRadius;

@end

@implementation YMDiaryPostsCellLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _opaque = YES;
        _scale  = [UIScreen mainScreen].scale;
        _imageCornerRadius  = 8;
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    YMDiaryPostsCellLayout *cellLayout = [[[self class] alloc] init];
    cellLayout.opaque           = self.opaque;
    cellLayout.scale            = self.scale;
    cellLayout.drawSize         = self.drawSize;
    cellLayout.titleRect        = self.titleRect;
    cellLayout.contentTextRect  = self.contentTextRect;
    cellLayout.imagesTotalRect  = self.imagesTotalRect;
    cellLayout.imageTotalCount  = self.imageTotalCount;
    cellLayout.imageRectValues  = [self.imageRectValues copy];
    cellLayout.imageCornerRadius= self.imageCornerRadius;
    
    return cellLayout;
}

@end


@implementation YMMutableDiaryPostsCellLayout

@dynamic opaque;
@dynamic scale;
@dynamic insets;
@dynamic drawSize;
@dynamic titleRect;
@dynamic contentTextRect;
@dynamic imagesTotalRect;
@dynamic imageTotalCount;
@dynamic imageRectValues;
@dynamic imageCornerRadius;

@end
