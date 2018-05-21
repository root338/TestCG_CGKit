//
//  YMFilterViewConfig.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 ym. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface YMFilterViewConfig : NSObject

#pragma mark - 列表cell的设置
@property (nonatomic, assign) CGFloat cellHeight;
/// cell text文本
@property (nullable, nonatomic, strong) UIColor *textColor;
/// cell text 字体
@property (nullable, nonatomic, strong) UIFont *textFont;
/// 选中的字体颜色
@property (nullable, nonatomic, strong) UIColor *selectedTextColor;

@end

NS_ASSUME_NONNULL_END
