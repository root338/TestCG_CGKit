//
//  YMAppFilterModel.m
//  QuickAskCommunity
//
//  Created by apple on 2018/5/7.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMAppFilterModel.h"

@interface YMAppFilterModel ()

@property (nonatomic, strong, readwrite) NSString *code;

@property (nonatomic, strong, readwrite) NSString *name;

@end

@implementation YMAppFilterModel

- (instancetype)initWithCode:(NSString *)code name:(NSString *)name
{
    self = [super init];
    if (self) {
        _code = code;
        _name = name;
    }
    return self;
}

@end
