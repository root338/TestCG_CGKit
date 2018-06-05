//
//  MLScrollCellItem.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/3.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLScrollCellItem : NSObject

@property (nonatomic, assign) CGRect cellFrame;
@property (nullable, nonatomic, copy) NSIndexPath * indexPath;

@property (nonatomic, assign, readonly) CGFloat minX;
@property (nonatomic, assign, readonly) CGFloat maxX;
@property (nonatomic, assign, readonly) CGFloat minY;
@property (nonatomic, assign, readonly) CGFloat maxY;

@end

NS_ASSUME_NONNULL_END
