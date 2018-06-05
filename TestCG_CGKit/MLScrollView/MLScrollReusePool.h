//
//  MLScrollReusePool.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLScrollReusePool : NSObject

- (void)addItemView:(UIView *)itemView forReuseIdentifier:(NSString *)reuseIdentifier;
- (nullable UIView *)dequeueItemViewForReuseIdentifier:(NSString *)reuseIdentifier;
- (nullable UIView *)dequeueItemViewForReuseIdentifier:(NSString *)reuseIdentifier andIndexPath:(nullable NSIndexPath *)indexPath;
- (void)clear;
- (nullable NSSet<UIView *> *)allItemViews;

@end

NS_ASSUME_NONNULL_END
