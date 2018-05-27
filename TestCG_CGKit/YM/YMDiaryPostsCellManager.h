//
//  YMDiaryPostsCellManager.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YMDiaryPostsCellLayout;

@interface YMDiaryPostsCellManager<ObjectType> : NSObject

- (CGFloat)getCellHeightWithData:(NSIndexPath *)indexPath width:(CGFloat)width;
- (void)getDiaryPostsContentImageWithIndexPath:(NSIndexPath *)indexPath completion:(void (^) (UIImage *image))completion;

- (YMDiaryPostsCellLayout *)createCellLayoutWithData:(ObjectType)data width:(CGFloat)width;

- (void)getDiaryPostsContentImageWithData:(ObjectType)data layout:(YMDiaryPostsCellLayout *)layout completion:(void (^) (UIImage *image))completion;

@end
