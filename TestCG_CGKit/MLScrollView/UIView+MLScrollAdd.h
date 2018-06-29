//
//  UIView+MLScrollAdd.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MLScrollAdd)

@property (nullable, nonatomic, copy) NSString *mlReuseIdentifier;
@property (nullable, nonatomic, copy) NSIndexPath *mlIndexPath;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;
- (instancetype)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier;

@end

NS_ASSUME_NONNULL_END
