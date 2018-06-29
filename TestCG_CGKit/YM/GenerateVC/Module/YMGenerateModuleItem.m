//
//  YMGenerateModuleItem.m
//  QuickAskCommunity
//
//  Created by apple on 2018/6/14.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMGenerateModuleItem.h"
#import "YMGenerateItem.h"

@implementation YMGenerateModuleItem

+ (instancetype)createWithItem:(YMGenerateItem *)item error:(NSError *__autoreleasing  _Nullable * _Nullable)error
{
    
    YMGenerateModuleItem *moduleItem = [self createWithTargetURL:item.targetURL error:error];
    if (moduleItem == nil) { return nil; }
    
    moduleItem.parameters   = item.parameters;
    
    return moduleItem;
}

+ (instancetype)createWithTargetURL:(NSURL *)targetURL error:(NSError *__autoreleasing  _Nullable *)error
{
    NSString *moduleName    = [self moduleNameWithTargetURL:targetURL error:error];
    if (moduleName.length == 0) { return nil; }
    
    YMGenerateModuleItem *moduleItem = [[self alloc] init];
    
    moduleItem.targetURL    = targetURL;
    moduleItem.moduleName   = moduleName;
    moduleItem.modulePath   = targetURL.path;
    moduleItem.query        = [self queryWithURL:targetURL];
    
    return moduleItem;
}

+ (NSDictionary<NSString *, NSString *> *)queryWithURL:(NSURL *)targetURL
{
    NSDictionary *query     = nil;
    if (targetURL.query.length > 0) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        NSArray *tmpQuery = [targetURL.query componentsSeparatedByString:@"&"];
        [tmpQuery enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSRange range = [obj rangeOfString:@"="];
            if (range.location != NSNotFound) {
                [dict setObject:[obj substringFromIndex:range.location + 1] forKey:[obj substringToIndex:range.location]];
            }
        }];
        query = dict;
    }
    return query;
}

+ (NSString *)moduleNameWithTargetURL:(NSURL *)targetURL error:(NSError **)error
{
    NSString *path = targetURL.path;
    NSString *pattern = @"^/[a-zA-Z0-9]*/?";
    NSError *err = nil;
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&err];
    
    if (err != nil) {
        if (error != nil) { *error = err; }
        return nil;
    }
    
    NSTextCheckingResult *result = [regularExpression firstMatchInString:path options:NSMatchingReportCompletion range:NSMakeRange(0, path.length)];
    NSString *moduleName = [path substringWithRange:result.range];
    if ([moduleName hasPrefix:@"/"]) {
        moduleName = [moduleName substringFromIndex:1];
    }
    if ([moduleName hasSuffix:@"/"]) {
        moduleName = [moduleName substringToIndex:moduleName.length - 1];
    }
    return moduleName;
}

- (NSString *)host { return self.targetURL.host; }

@end
