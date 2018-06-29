//
//  YMGenerateMainVC.m
//  QuickAskCommunity
//
//  Created by apple on 2018/6/6.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMGenerateMainVC.h"

#import "YMGenerateModuleItem.h"

#import "YMGenerateTaoModuleVC.h"
#import "YMGeneratePostsModuleVC.h"
#import "YMGenerateHospitalDoctorModuleVC.h"

@implementation YMGenerateMainVC

+ (BOOL)isAvailableGenerateMainVCWithURL:(NSURL *)targetURL
{
    if ([targetURL.scheme isEqualToString:YMPushURLScheme]) {
        if ([targetURL.host isEqualToString:YMPushURLMainHost]) {
            return YES;
        }
    }
    return NO;
}

+ (nullable UIViewController *)generateMainVCWithURL:(NSURL *)targetURL
{
    if ([self isAvailableGenerateMainVCWithURL:targetURL]) {
        NSError *error = nil;
        YMGenerateModuleItem *moduleItem = [YMGenerateModuleItem createWithTargetURL:targetURL error:&error];
        CGDebugAssert(error == nil, @"创建模块信息块失败");
        return [self generateMainVCWithModuleItem:moduleItem];
    }
    return nil;
}

+ (UIViewController *)generateMainVCWithItem:(YMGenerateItem *)item
{
    NSError *error = nil;
    YMGenerateModuleItem *moduleItem = [YMGenerateModuleItem createWithItem:item error:&error];
    CGDebugAssert(error == nil, @"创建模块信息块失败");
    if (moduleItem) {
        return [self generateMainVCWithModuleItem:moduleItem];
    }
    return nil;
}

+ (UIViewController *)generateMainVCWithModuleItem:(YMGenerateModuleItem *)moduleItem
{
    NSArray *modules = [self moduleArray];
    for (id<YMGenerateModuleProtocol> module in modules) {
        if ([module conformsToProtocol:@protocol(YMGenerateModuleProtocol)]) {
            
            NSString *moduleName = [module moduleName];
            if ([moduleItem.moduleName hasPrefix:moduleName]) {
                return [module generateMuduleVCWithItem:moduleItem];
            }
        }
    }
    return nil;
}

+ (NSArray *)moduleArray
{
    return @[
             [YMGenerateTaoModuleVC class],
             [YMGeneratePostsModuleVC class],
             [YMGenerateHospitalDoctorModuleVC class],
             ];
}

@end
