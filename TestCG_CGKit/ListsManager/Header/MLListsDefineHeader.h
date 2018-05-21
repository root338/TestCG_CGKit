//
//  MLListsDefineHeader.h
//  TestCG_CGKit
//
//  Created by apple on 2018/5/21.
//  Copyright © 2018年 apple. All rights reserved.
//

#ifndef MLListsDefineHeader_h
#define MLListsDefineHeader_h

#pragma mark - 导入头文件

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#pragma mark - 数据相关值定义


/**
 列表元数据状态

 - MLListsSourceDataStatusLoading: 加载
 - MLListsSourceDataStatusLoadEnd: 加载结束
 - MLListsSourceDataStatusIsEmpty: 加载结束，数据为空
 */
typedef NS_ENUM(NSInteger, MLListsSourceDataStatus) {
    MLListsSourceDataStatusLoading,
    MLListsSourceDataStatusLoadEnd,
    MLListsSourceDataStatusIsEmpty
};

typedef NS_ENUM(NSInteger, MLListsSourceDataProcessingType) {
    MLListsSourceDataProcessingTypeAdd,
    MLListsSourceDataProcessingTypeRemove,
};

#endif /* MLListsDefineHeader_h */
