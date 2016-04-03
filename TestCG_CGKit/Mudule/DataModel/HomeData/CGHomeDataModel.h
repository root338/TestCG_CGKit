//
//  CGHomeDataModel.h
//  TestCG_CGKit
//
//  Created by DY on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGBaseObject.h"

/** 视图的加载方式 */
typedef NS_ENUM(NSInteger, CGLoadType) {
    
    /** 类创建，加载 */
    CGLoadTypeClass,
    /** xib方式加载 */
    CGLoadTypeXIB,
    /** storyboard 方式加载 */
    CGLoadTypeStoryboard,
};

typedef NS_ENUM(NSInteger, CGShowType) {
    
    /** 弹入 */
    CGShowTypePush,
    /** 模态视图 */
    CGShowTypeModel,
};

NS_ASSUME_NONNULL_BEGIN

/** 首页数据模型 */
@interface CGHomeDataModel : CGBaseObject

@property (nonatomic, assign) Class className;

@property (nonatomic, strong) NSString *title;

@property (nullable, nonatomic, strong) NSString *subtitle;

@property (nonatomic, assign) CGShowType showType;
@property (nonatomic, assign) CGLoadType loadType;

/** 当加载方式为xib时使用 默认为类名 */
@property (nonatomic, strong) NSString *xibFileName;

/** 当加载方式为storyboard时使用 默认为rootViewController下的storyboard值 */
@property (nullable, nonatomic, strong) UIStoryboard *storyboard;
/** 当加载方式为storyboard时使用 默认为类名 */
@property (nonatomic, strong) NSString *storyboardID;

- (nullable __kindof UIViewController *)createTargetViewController;

+ (instancetype)cg_createHomeDataWithClass:(Class)paramClass;
+ (instancetype)cg_createHomeDataWithClass:(Class)paramClass subtitle:(nullable NSString *)subtitle;
+ (instancetype)cg_createHomeDataWithClass:(Class)paramClass title:(nullable NSString *)title subtitle:(nullable NSString *)subtitle;

@end


@interface CGHomeDataModel (CGHomeDataSource)

+ (NSArray <CGHomeDataModel *> *)cg_getHomeDataSourceList;

@end

NS_ASSUME_NONNULL_END