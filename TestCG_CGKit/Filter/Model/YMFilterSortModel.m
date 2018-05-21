//
//  YMFilterSortModel.m
//  QuickAskCommunity
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 ym. All rights reserved.
//

#import "YMFilterSortModel.h"

@interface YMFilterSortModel ()

@property (nonatomic, assign, readwrite) YMAppFilterModelType sourceType;

@end

@implementation YMFilterSortModel

- (instancetype)initWithSourceType:(YMAppFilterModelType)sourceType
{
    self = [super init];
    if (self) {
        
        _sourceType = sourceType;
    }
    return self;
}

@end
