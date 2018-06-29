//
//  YMGenerateModuleItem.h
//  QuickAskCommunity
//
//  Created by apple on 2018/6/14.
//  Copyright © 2018年 ym. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class YMGenerateItem;
@interface YMGenerateModuleItem : NSObject

@property (nonatomic, strong) NSURL * targetURL;
@property (nonatomic, strong, readonly) NSString * host;

@property (nonatomic, strong) NSString * moduleName;
@property (nonatomic, strong) NSString * modulePath;
@property (nullable, nonatomic, strong) NSDictionary<NSString *, NSString *> * query;

@property (nullable, nonatomic, strong) NSDictionary<NSString *, id> * parameters;

+ (nullable instancetype)createWithItem:(YMGenerateItem *)item error:(NSError * _Nullable *)error;
+ (nullable instancetype)createWithTargetURL:(NSURL *)targetURL error:(NSError * _Nullable *)error;

@end

NS_ASSUME_NONNULL_END
