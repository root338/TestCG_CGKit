//
//  UIView+MLAdd.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MLAdd)

#pragma mark - 设置
/// 设置所有子视图背景色
- (void)setAllSubviewsBackgroundColor:(UIColor *)backgroundColor;

#pragma mark - 视图操作
- (void)ml_removeAllSubviews;

@end
