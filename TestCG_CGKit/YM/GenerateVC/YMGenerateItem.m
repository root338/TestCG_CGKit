//
//  YMGenerateItem.m
//  QuickAskCommunity
//
//  Created by apple on 2018/6/14.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMGenerateItem.h"

@interface YMGenerateItem ()

@property (nonatomic, strong, readwrite) NSURL * targetURL;

@end

@implementation YMGenerateItem

- (instancetype)initWithTargetURL:(NSURL *)targetURL
{
    self = [super init];
    if (self) {
        _targetURL = targetURL;
    }
    return self;
}

@end
