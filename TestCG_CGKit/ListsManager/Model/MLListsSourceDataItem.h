//
//  MLListsSourceDataItem.h
//  TestCG_CGKit
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLListsDefineHeader.h"

#import "MLListsSourceData.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLListsSourceDataItem<__covariant ObjectType> : NSObject

/// 每页加载的大小
@property (nonatomic, assign) NSInteger pageSize;
/// 单列数据的加载状态
@property (nonatomic, assign) MLListsSourceDataStatus status;
/// 单列源数据
@property (nonatomic, strong) MLListsSourceData<ObjectType> *listsSourceData;

@end

NS_ASSUME_NONNULL_END
