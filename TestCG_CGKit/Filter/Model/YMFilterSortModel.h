//
//  YMFilterSortModel.h
//  QuickAskCommunity
//
//  Created by apple on 2018/5/8.
//  Copyright © 2018年 ym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMAppFilterModelTypeHeader.h"

@class YMFilterViewConfig;

@protocol YMFilterSortModel <NSObject>
/// 来源
@property (nonatomic, assign, readonly) YMAppFilterModelType sourceType;

@end
/// 排序/筛选
@interface YMFilterSortModel : NSObject<YMFilterSortModel>

@property (nonatomic, assign, readonly) YMAppFilterModelType sourceType;

@property (nonatomic, strong) NSArray<id<YMAppFilterModelProtocol>> *filterList;
@property (nonatomic, strong) YMFilterViewConfig *filterViewConfig;

- (instancetype)initWithSourceType:(YMAppFilterModelType)sourceType;

@end
