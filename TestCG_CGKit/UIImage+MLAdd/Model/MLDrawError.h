//
//  MLDrawError.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLDefineHeader.h"

NS_ASSUME_NONNULL_BEGIN
/// 错误的类型
typedef NSString * MLDrawErrorDomain;
/// 错误信息里面的 key
typedef NSString * MLDrawUserInfoKey;

#pragma mark - 错误的类型
/// 路径错误
ML_EXTERN MLDrawErrorDomain const MLPathErrorDomain;

#pragma mark - 错误的信息 key
/// 错误的本地具体描述
ML_EXTERN MLDrawUserInfoKey const MLLocalizedDescriptionKey;


typedef NS_ENUM(NSInteger, MLDrawErrorCode) {
    MLDrawErrorCodeSuccess  = 0,
    /// 画布大小为 {0, 0}
    MLDrawErrorCodeSizeZero,
    
//-------------------------------------------
    // 路径错误
    MLDrawErrorCodePathBorderWidth = 100,
};

@interface MLDrawError : NSObject<NSCopying>

@property (nonatomic, copy, readonly) MLDrawErrorDomain domain;
@property (nonatomic, assign, readonly) NSInteger code;
@property (nullable, nonatomic, copy, readonly) NSDictionary<MLDrawUserInfoKey, id> *userInfo;

- (instancetype)init ML_UNAVAILABLE;

- (instancetype)initWithDomain:(MLDrawErrorDomain)domain code:(NSInteger)code;

@end

NS_ASSUME_NONNULL_END
