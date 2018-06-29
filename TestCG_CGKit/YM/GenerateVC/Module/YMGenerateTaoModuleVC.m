//
//  YMGenerateTaoModuleVC.m
//  QuickAskCommunity
//
//  Created by apple on 2018/6/6.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMGenerateTaoModuleVC.h"

#import "TaoDetailViewController.h"

@implementation YMGenerateTaoModuleVC

@dynamic moduleName;

+ (NSString *)moduleName
{
    return YMPushURLTaoModuleName;
}

+ (nullable UIViewController *)generateMuduleVCWithItem:(YMGenerateModuleItem *)item {
    
    NSString *modulePath = item.modulePath;
    if ([modulePath isEqualToString:YMPushURLTaoDetailPath]) {
        
        NSString *taoId = item.query[@"taoId"];
        CGDebugAssert(taoId.length, @"缺少taoId");
        if (taoId.length == 0) { return nil; }
        
        TaoDetailViewController *taoDetailVC = [[TaoDetailViewController alloc] init];
        taoDetailVC.taoId = taoId;
        return taoDetailVC;
    }
    return nil;
}

@end
