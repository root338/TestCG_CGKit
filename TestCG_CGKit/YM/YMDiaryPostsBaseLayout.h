//
//  YMDiaryPostsBaseLayout.h
//  TestCG_CGKit
//
//  Created by apple on 2018/5/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMDiaryPostsBaseLayout : NSObject<NSCopying>

/// 是否不透明，默认YES
@property (nonatomic, assign, readonly) CGFloat opaque;
/// 比例因子 , 默认 [UIScreen mainScreen].scale;
@property (nonatomic, assign, readonly) CGFloat scale;
/// 画布大小
@property (nonatomic, assign, readonly) CGSize drawSize;
/// 边距
@property (nonatomic, assign, readonly) UIEdgeInsets insets;

@end

