//
//  YMDiaryPostsRecommendDiaryCellLayout.h
//  TestCG_CGKit
//
//  Created by apple on 2018/5/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YMDiaryPostsBaseLayout.h"

@interface YMDiaryPostsRecommendDiaryCellLayout : YMDiaryPostsBaseLayout<NSCopying>

@property (nonatomic, assign, readonly) CGRect imageRect;
@property (nonatomic, assign, readonly) CGRect diaryNumberTextRect;
@property (nonatomic, assign, readonly) CGRect titleRect;
@property (nonatomic, assign, readonly) CGRect userAvatarRect;
@property (nonatomic, assign, readonly) CGRect userNameRect;
@property (nonatomic, assign, readonly) CGRect browseMarkRect;
@property (nonatomic, assign, readonly) CGRect browseNumberRect;

@end

@interface YMMutableDiaryPostsRecommendDiaryCellLayout : YMDiaryPostsRecommendDiaryCellLayout

@property (nonatomic) CGSize drawSize;
@property (nonatomic) CGFloat opaque;
@property (nonatomic) CGFloat scale;
@property (nonatomic) UIEdgeInsets insets;
@property (nonatomic) CGRect imageRect;
@property (nonatomic) CGRect diaryNumberTextRect;
@property (nonatomic) CGRect titleRect;
@property (nonatomic) CGRect userAvatarRect;
@property (nonatomic) CGRect userNameRect;
@property (nonatomic) CGRect browseMarkRect;
@property (nonatomic) CGRect browseNumberRect;

@end
