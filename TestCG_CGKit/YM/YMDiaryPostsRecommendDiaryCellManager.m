//
//  YMDiaryPostsRecommendDiaryCellManager.m
//  TestCG_CGKit
//
//  Created by apple on 2018/5/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "YMDiaryPostsRecommendDiaryCellManager.h"

#import "NSDictionary+NSAttributedStringKey.h"
#import "YMDiaryPostsRecommendDiaryCellLayout.h"

@interface YMDiaryPostsRecommendDiaryCellManager ()

@property (nonatomic, strong) NSDictionary *diaryNumberAttDict;
@property (nonatomic, strong) NSDictionary *diaryTitleAttDict;
@property (nonatomic, strong) NSDictionary *userNameAttDict;
@property (nonatomic, strong) NSDictionary *browseNumberAttDict;

@property (nonatomic, strong) YMDiaryPostsRecommendDiaryCellLayout *cellLayout;
@end

@implementation YMDiaryPostsRecommendDiaryCellManager

- (UICollectionViewFlowLayout *)createDiaryPostsRecommendDiaryCollectionViewFlowLayoutWithWidth:(CGFloat)width
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection  = UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset     = UIEdgeInsetsMake(4.5, 20, 17.5, 20);
    CGFloat itemWidth           = (width - flowLayout.sectionInset.left - flowLayout.sectionInset.right) / 2.0;
    YMDiaryPostsRecommendDiaryCellLayout *cellLayout = [self createCellLayoutWithWidth:itemWidth];
    self.cellLayout             = cellLayout;
    flowLayout.itemSize         = CGSizeMake(itemWidth, cellLayout.drawSize.height);

    return flowLayout;
}

//- (CGFloat)getCellHeightWithData:(id)data indexPath:(NSIndexPath *)indexPath width:(CGFloat)width
//{
//
//}

- (void)getCellContentImageWithData:(id)data indexPath:(NSIndexPath *)indexPath completion:(void (^) (UIImage *image))completion
{
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{

        YMDiaryPostsRecommendDiaryCellLayout *cellLayout = self.cellLayout;
        UIGraphicsBeginImageContextWithOptions(cellLayout.drawSize, cellLayout.opaque, cellLayout.scale);


        dispatch_sync(dispatch_get_main_queue(), ^{
            if (completion) {
//                completion
            }
        });
    });
}

- (YMDiaryPostsRecommendDiaryCellLayout *)createCellLayoutWithWidth:(CGFloat)width
{

    UIEdgeInsets insets = UIEdgeInsetsMake(12.5, 0, 12.5, 0);

    CGFloat contentOriginX  = 0;
    CGFloat contentMaxWidth = width - contentOriginX - insets.right;

    CGPoint point       = CGPointMake(contentOriginX, insets.top);

    CGRect imageRect    = CGRectMake(point.x, point.y, contentMaxWidth, contentMaxWidth);
    point.y             = CGRectGetMaxY(imageRect) + 12;

    UIFont *diaryFont = self.diaryNumberAttDict[NSFontAttributeName];
    CGRect diaryNumberRect = CGRectMake(CGRectGetMinX(imageRect) + 5, CGRectGetMaxY(imageRect) - 7 - diaryFont.lineHeight, CGRectGetWidth(imageRect) - 10, diaryFont.lineHeight);

    UIFont *titleFont   = self.diaryTitleAttDict[NSFontAttributeName];
    CGRect titleRect    = CGRectMake(point.x, point.y, contentMaxWidth, titleFont.lineHeight * 2 + 5);
    point.y = CGRectGetMaxY(titleRect) + 13;

    CGRect userAvatarRect = CGRectMake(point.x, point.y, 18, 18);

    YMMutableDiaryPostsRecommendDiaryCellLayout *cellLayout = [[YMMutableDiaryPostsRecommendDiaryCellLayout alloc] init];
    cellLayout.drawSize = CGSizeMake(width, CGRectGetMaxY(userAvatarRect) + insets.bottom);
    cellLayout.insets   = insets;
    cellLayout.diaryNumberTextRect = diaryNumberRect;
    cellLayout.titleRect = titleRect;
    cellLayout.userAvatarRect  = userAvatarRect;

    return cellLayout;
}

- (NSDictionary *)diaryNumberAttDict
{
    if (_diaryNumberAttDict) {
        return _diaryNumberAttDict;
    }

    _diaryNumberAttDict = [NSDictionary ml_attDictWithFont:[UIFont systemFontOfSize:12] color:[UIColor whiteColor]];

    return _diaryNumberAttDict;
}

- (NSDictionary *)diaryTitleAttDict
{
    if (_diaryTitleAttDict) {
        return _diaryTitleAttDict;
    }

    _diaryTitleAttDict = [NSDictionary ml_attDictWithFont:[UIFont systemFontOfSize:12] color:[UIColor blackColor]];

    return _diaryTitleAttDict;
}

- (NSDictionary *)userNameAttDict
{
    if (_userNameAttDict) {
        return _userNameAttDict;
    }

    _userNameAttDict = @{
                         NSFontAttributeName : [UIFont systemFontOfSize:10],
                         NSForegroundColorAttributeName : [UIColor lightGrayColor],
                         };

    return _userNameAttDict;
}

- (NSDictionary *)browseNumberAttDict
{
    if (_browseNumberAttDict) {
        return _browseNumberAttDict;
    }

    _browseNumberAttDict = @{
                             NSFontAttributeName : [UIFont systemFontOfSize:11],
                             NSForegroundColorAttributeName : [UIColor blackColor],
                             };

    return _browseNumberAttDict;
}



@end
