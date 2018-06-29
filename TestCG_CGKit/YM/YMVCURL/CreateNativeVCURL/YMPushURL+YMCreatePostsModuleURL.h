//
//  YMPushURL+YMCreatePostsModuleURL.h
//  QuickAskCommunity
//
//  Created by apple on 2018/6/28.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMPushURL.h"

NS_ASSUME_NONNULL_BEGIN

@interface YMPushURL (YMCreatePostsModuleURL)


+ (nullable NSURL *)createUserHomePageVCWithUserId:(NSString *)userId;
+ (nullable NSURL *)createUpdateDiaryVCWithPostsId:(NSString *)postsId;
+ (nullable NSURL *)createRecommendUserPostsListWithDiaryBookId:(NSString *)diaryBookId;
+ (nullable NSURL *)createBigImageBrowseWithPostsId:(NSString *)postId index:(NSInteger)index;
+ (nullable NSURL *)createSurgeryAfterAlbumWithPostsId:(NSString *)postsId userId:(NSString *)userId;

@end
NS_ASSUME_NONNULL_END
