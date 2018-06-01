//
//  YMDiaryPostsRecommendDiaryCellLayout.m
//  TestCG_CGKit
//
//  Created by apple on 2018/5/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YMDiaryPostsRecommendDiaryCellLayout.h"

@interface YMDiaryPostsRecommendDiaryCellLayout ()

@property (nonatomic, assign, readwrite) CGRect imageRect;
@property (nonatomic, assign, readwrite) CGRect diaryNumberTextRect;
@property (nonatomic, assign, readwrite) CGRect titleRect;
@property (nonatomic, assign, readwrite) CGRect userAvatarRect;
@property (nonatomic, assign, readwrite) CGRect userNameRect;
@property (nonatomic, assign, readwrite) CGRect browseMarkRect;
@property (nonatomic, assign, readwrite) CGRect browseNumberRect;

@end

@implementation YMDiaryPostsRecommendDiaryCellLayout


#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    typeof(self) layout = [super copyWithZone:zone];
    layout.imageRect    = self.imageRect;
    layout.diaryNumberTextRect  = self.diaryNumberTextRect;
    layout.titleRect    = self.titleRect;
    layout.userAvatarRect   = self.userAvatarRect;
    layout.userNameRect = self.userNameRect;
    layout.browseMarkRect   = self.browseMarkRect;
    layout.browseNumberRect = self.browseNumberRect;
    
    return layout;
}

@end

@implementation YMMutableDiaryPostsRecommendDiaryCellLayout

@dynamic opaque;
@dynamic scale;
@dynamic insets;
@dynamic drawSize;
@dynamic imageRect;
@dynamic diaryNumberTextRect;
@dynamic titleRect;
@dynamic userAvatarRect;
@dynamic userNameRect;
@dynamic browseMarkRect;
@dynamic browseNumberRect;

@end
