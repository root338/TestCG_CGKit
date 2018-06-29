//
//  YMGenerateMainVC.h
//  QuickAskCommunity
//
//  Created by apple on 2018/6/6.
//  Copyright © 2018年 ym. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class YMGenerateItem;
@interface YMGenerateMainVC : NSObject

+ (BOOL)isAvailableGenerateMainVCWithURL:(NSURL *)targetURL;

+ (nullable UIViewController *)generateMainVCWithURL:(NSURL *)targetURL;

+ (nullable UIViewController *)generateMainVCWithItem:(YMGenerateItem *)item;

@end

NS_ASSUME_NONNULL_END
