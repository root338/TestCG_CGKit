//
//  YMPushURL+YMCreateTaoModuleURL.m
//  QuickAskCommunity
//
//  Created by apple on 2018/6/28.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMPushURL+YMCreateTaoModuleURL.h"

@implementation YMPushURL (YMCreateTaoModuleURL)

+ (NSURL *)createTaoDetailVCWithTaoId:(NSString *)taoId
{
    if (taoId.length == 0) {
        return nil;
    }
    NSDictionary *parameters = @{
                                 @"taoId" : taoId,
                                 };
    return [YMPushURL createPushURLWithPath:YMPushURLTaoDetailPath parameters:parameters];
}

@end
