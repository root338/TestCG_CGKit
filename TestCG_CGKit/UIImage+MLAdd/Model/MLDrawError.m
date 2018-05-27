//
//  MLDrawError.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDrawError.h"

MLDrawErrorDomain const MLPathErrorDomain = @"ML_PathErrorDomain";

@interface MLDrawError ()
{
    
}
@property (nonatomic, copy, readwrite) MLDrawErrorDomain domain;
@property (nonatomic, assign, readwrite) NSInteger code;
@property (nullable, nonatomic, copy, readwrite) NSDictionary<MLDrawUserInfoKey, id> *userInfo;

@end

@implementation MLDrawError

- (instancetype)initWithDomain:(MLDrawErrorDomain)domain code:(NSInteger)code
{
    self = [super init];
    if (self) {
        _domain = domain;
        _code   = code;
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone
{
    MLDrawError *drawError  = [[[self class] alloc] initWithDomain:self.domain code:self.code];
    drawError.userInfo      = [self.userInfo copy];
    return drawError;
}

@end
