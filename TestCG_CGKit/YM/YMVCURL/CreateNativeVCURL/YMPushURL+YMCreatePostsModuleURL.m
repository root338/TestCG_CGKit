//
//  YMPushURL+YMCreatePostsModuleURL.m
//  QuickAskCommunity
//
//  Created by apple on 2018/6/28.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMPushURL+YMCreatePostsModuleURL.h"

@implementation YMPushURL (YMCreatePostsModuleURL)

+ (NSURL *)createUserHomePageVCWithUserId:(NSString *)userId
{
    if (userId == nil || userId.length == 0) { return nil; }
    NSDictionary *parameters = @{
                                 @"userId" : userId,
                                 };
    return [YMPushURL createPushURLWithPath:YMPushURLUserHomePagePath parameters:parameters];
}

+ (NSURL *)createUpdateDiaryVCWithPostsId:(NSString *)postsId
{
    if (postsId.length == 0) { return nil; }
    NSDictionary *parameters = @{
                                 @"postsId" : postsId,
                                 };
    return [YMPushURL createPushURLWithPath:YMPushURLUpdateDiaryPagePath parameters:parameters];
}

+ (NSURL *)createRecommendUserPostsListWithDiaryBookId:(NSString *)diaryBookId
{
    if (diaryBookId.length == 0) { return nil; }
    NSDictionary *parameters = @{
                                 @"diaryBookId" : diaryBookId,
                                 };
    return [YMPushURL createPushURLWithPath:YMPushURLRecommendUserPostsListPagePath parameters:parameters];
}

+ (NSURL *)createBigImageBrowseWithPostsId:(NSString *)postId index:(NSInteger)index
{
    if (postId.length == 0 ) { return nil; }
    
    NSDictionary *parameters = @{
                                 @"postsId" : postId,
                                 @"index"   : [@(index) stringValue],
                                 };
    return [YMPushURL createPushURLWithPath:YMPushURLPostsBigImageBrowsePath parameters:parameters];
}

+ (NSURL *)createSurgeryAfterAlbumWithPostsId:(NSString *)postsId userId:(NSString *)userId
{
    if (postsId.length == 0) { return nil; }
    
    NSDictionary *parameters = @{
                                 @"postsId" : postsId,
                                 @"userId"  : userId,
                                 };
    return [YMPushURL createPushURLWithPath:YMPushURLPostsSurgeryAfterAlbumPath parameters:parameters];
}

@end
