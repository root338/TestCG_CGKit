//
//  YMPushURL.m
//  QuickAskCommunity
//
//  Created by apple on 2018/6/6.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMPushURL.h"

YMAppPushURLScheme const YMPushURLScheme    = @"ymmainapp";
YMAppPushURLHost const YMPushURLMainHost    = @"www.yuemei.mainapp";

@implementation YMPushURL

@dynamic baseMainURL;

+ (NSString *)baseMainURL
{
    return [NSString stringWithFormat:@"%@://%@",YMPushURLScheme, YMPushURLMainHost];
}

+ (NSURL * _Nonnull (^)(YMAppPushURLPath _Nonnull))targetURL
{
    return ^(YMAppPushURLPath path) {
        NSString *targetURLStr = [NSString stringWithFormat:@"%@%@", self.baseMainURL, path];
        NSURL *targetURL = [NSURL URLWithString:targetURLStr];
        return targetURL;
    };
}

+ (NSURL *)createPushURLWithPath:(YMAppPushURLPath)path parameters:(NSDictionary<NSString *,NSString *> *)parameters
{
    NSMutableString *targetURLStr = [NSMutableString stringWithFormat:@"%@%@", self.baseMainURL, path];
    NSInteger parametersCount = parameters.count;
    if (parametersCount > 0) {
        
        NSMutableString *query  = [NSMutableString string];
        [parameters enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull obj, BOOL * _Nonnull stop) {
            
            [query appendFormat:@"%@%@=%@", query.length == 0 ? @"?" : @"&", key, obj];
        }];
        [targetURLStr appendString:query];
    }
    
    NSURL *targetURL = [NSURL URLWithString:targetURLStr];
    return targetURL;
}

@end
