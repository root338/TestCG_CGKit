//
//  YMDiaryPostsCellLayout.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YMDiaryPostsBaseLayout.h"

@interface YMDiaryPostsCellLayout : YMDiaryPostsBaseLayout<NSCopying>

/// 标题的显示区域
@property (nonatomic, assign, readonly) CGRect titleRect;
/// 内容的显示区域
@property (nonatomic, assign, readonly) CGRect contentTextRect;
/// 图片的总共显示区域
@property (nonatomic, assign, readonly) CGRect imagesTotalRect;
/// 图片的个数
@property (nonatomic, assign, readonly) NSUInteger imageTotalCount;
/// 图片显示区域的数组
@property (nonatomic, strong, readonly) NSArray<NSValue *> *imageRectValues;
/// 图片圆角, 默认 8
@property (nonatomic, assign, readonly) CGFloat imageCornerRadius;
@end

@interface YMMutableDiaryPostsCellLayout : YMDiaryPostsCellLayout

@property (nonatomic) CGSize drawSize;
@property (nonatomic) CGFloat opaque;
@property (nonatomic) CGFloat scale;
@property (nonatomic) UIEdgeInsets insets;
@property (nonatomic) CGRect titleRect;
@property (nonatomic) CGRect contentTextRect;
@property (nonatomic) CGRect imagesTotalRect;
@property (nonatomic) NSUInteger imageTotalCount;
@property (nonatomic) NSArray<NSValue *> *imageRectValues;
@property (nonatomic) CGFloat imageCornerRadius;

@end
