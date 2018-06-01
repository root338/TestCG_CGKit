//
//  YMDiaryPostsRecommendDiaryCellManager.h
//  TestCG_CGKit
//
//  Created by apple on 2018/5/28.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMDiaryPostsRecommendDiaryCellManager : NSObject

- (UICollectionViewFlowLayout *)createDiaryPostsRecommendDiaryCollectionViewFlowLayoutWithWidth:(CGFloat)width;

//- (CGFloat)getCellHeightWithData:(id)data indexPath:(NSIndexPath *)indexPath width:(CGFloat)width;

- (void)getCellContentImageWithData:(id)data indexPath:(NSIndexPath *)indexPath completion:(void (^) (UIImage *image))completion;

@end
