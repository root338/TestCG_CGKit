//
//  YMGeneratePostsModuleVC.m
//  QuickAskCommunity
//
//  Created by apple on 2018/6/6.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMGeneratePostsModuleVC.h"

#import "YMDiaryPostsCommentParameter.h"

#import "YMSurgeryAfterAlbumVC.h"
#import "YMDiaryBigImageBrowseVC.h"
#import "UpdateDiaryViewController.h"
#import "YMPlayerVideoViewController.h"
#import "YMUserHomePageViewController.h"
#import "YMDiaryPostsCommentListViewController.h"
#import "YMDiaryPostsRecommentPostsViewController.h"

@implementation YMGeneratePostsModuleVC

+ (NSString *)moduleName
{
    return YMPushURLPostsModuleName;
}

+ (UIViewController *)generateMuduleVCWithItem:(YMGenerateModuleItem *)item
{
    NSString *modulePath = item.modulePath;
    if ([modulePath isEqualToString:YMPushURLUserHomePagePath]) {
        
        NSString *userIdentifier = item.query[@"userId"];
        CGDebugAssert(userIdentifier, @"缺少用户id");
        if (userIdentifier.length == 0) { return nil; }
        
        YMUserHomePageViewController *userHomePage = [[YMUserHomePageViewController alloc] init];
        userHomePage.userIdentifier = userIdentifier;
        return userHomePage;
    }
    else if ([modulePath isEqualToString:YMPushURLUpdateDiaryPagePath]) {
        
        NSString *postsId = item.query[@"postsId"];
        CGDebugAssert(postsId.length, @"缺少帖子id");
        if (postsId.length == 0) { return nil; }
        
        UpdateDiaryViewController *updateDiaryVC = [[UpdateDiaryViewController alloc] init];
        updateDiaryVC.diaryId = postsId;
        return updateDiaryVC;
    }
    else if ([modulePath isEqualToString:YMPushURLRecommendUserPostsListPagePath]) {
        
        NSString *diaryBookId = item.query[@"diaryBookId"];
        CGDebugAssert(diaryBookId.length, @"缺少日记本 id");
        if (diaryBookId.length == 0) { return nil; }
        YMDiaryPostsRecommentPostsViewController *vc = [[YMDiaryPostsRecommentPostsViewController alloc] init];
        vc.diaryBookId = diaryBookId;
        return vc;
    }
    else if ([modulePath isEqualToString:YMPushURLPostsCommentListPath]) {
        
        id commentParameters = item.parameters[@"commentParameters"];
        CGDebugAssert(commentParameters, @"缺少评论列表必要参数");
        
        YMDiaryPostsCommentListViewController *vc = [[YMDiaryPostsCommentListViewController alloc] init];
        if ([commentParameters isKindOfClass:[YMDiaryPostsCommentParameter class]]) {
            vc.parametrs = commentParameters;
        }else if ([commentParameters isKindOfClass:[NSDictionary class]]) {
            vc.parametrs = [YMDiaryPostsCommentParameter modelWithJSON:commentParameters];
        }
        return vc;
    }
    else if ([modulePath isEqualToString:YMPushURLPostsBigImageBrowsePath]) {
        
        NSDictionary *parameters = item.query;
        
        NSString *postsId   = parameters[@"postsId"];
        NSString *index     = parameters[@"index"]?: @"0";
        CGDebugAssert(postsId, @"缺少帖子id");
        
        YMDiaryBigImageBrowseVC *vc = [[YMDiaryBigImageBrowseVC alloc] init];
        vc.currentDiaryID           = postsId;
        vc.currentImageIndex        = index;
        return vc;
    }
    else if ([modulePath isEqualToString:YMPushURLPostsSurgeryAfterAlbumPath]) {
        
        NSDictionary *parameters = item.query;
        NSString *userId    = parameters[@"userId"];
        NSString *postsId   = parameters[@"postsId"];
        
        YMSurgeryAfterAlbumVC *vc = [[YMSurgeryAfterAlbumVC alloc] init];
        vc.diaryID      = postsId;
        vc.diaryUID     = userId;
        return vc;
    }
    else if ([modulePath isEqualToString:YMPushURLPostsPlayerVideoPath]) {
        
        NSDictionary *parameters    = item.parameters;
        NSString *videoURL          = parameters[@"videoURL"];
        CGDebugAssert(videoURL.length, @"缺少视频URL");
        
        
        YMPlayerVideoViewController *vc = [[YMPlayerVideoViewController alloc] init];
        vc.videoURL = [NSURL URLWithString:videoURL];
        vc.videoStartPlayerInfoDict = parameters[@"currentPlayerInfo"];
        vc.itemsType    = [parameters[@"itemType"] integerValue];
        
        return vc;
    }
    
    return nil;
}

@end
