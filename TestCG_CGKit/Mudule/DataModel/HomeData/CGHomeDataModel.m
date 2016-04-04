//
//  CGHomeDataModel.m
//  TestCG_CGKit
//
//  Created by DY on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGHomeDataModel.h"

#import "AppDelegate.h"

#import "UIView+LoadXIBFile.h"
/** 查看系统相册 */
#import "CGPhotoNavigationController.h"

/** 宏定义收集 */
#import "CGTestDefinesTableViewController.h"
/** 测试约束 */
#import "CGTestLayoutConstranintsViewController.h"

@implementation CGHomeDataModel

+ (instancetype)cg_createHomeDataWithClass:(Class)paramClass
{
    return [self cg_createHomeDataWithClass:paramClass title:nil subtitle:nil];
}

+ (instancetype)cg_createHomeDataWithClass:(Class)paramClass subtitle:(NSString *)subtitle
{
    return [self cg_createHomeDataWithClass:paramClass title:nil subtitle:subtitle];
}

+ (instancetype)cg_createHomeDataWithClass:(Class)paramClass title:(NSString *)title subtitle:(NSString *)subtitle
{
    CGHomeDataModel *homeDataObject = [[self alloc] init];
    homeDataObject.className        = paramClass;
    homeDataObject.title            = title ? title : NSStringFromClass(paramClass);
    homeDataObject.subtitle         = subtitle;
    
    return homeDataObject;
}

- (nullable __kindof UIViewController *)createTargetViewController
{
    UIViewController *viewController    = nil;
    
    if (self.className == [CGPhotoNavigationController class]) {
        
        CGPhotoNavigationController *photoNavigationController = [CGPhotoNavigationController cg_createDefalutNavigationController];
        
        viewController  = photoNavigationController;
    }
    
    if (!viewController) {
        
        switch (self.loadType) {
            case CGLoadTypeClass:
                viewController  = [[self.className alloc] init];
                break;
            case CGLoadTypeXIB:
                viewController  = [self.className loadXIBFileWithName:self.xibFileName];
                break;
            case CGLoadTypeStoryboard:
                viewController  = [self.storyboard instantiateViewControllerWithIdentifier:self.storyboardID];
                break;
            default:
                break;
        }
        
        viewController.title    = self.title;
    }
    
    if (![viewController isKindOfClass:[UIViewController class]]) {
        viewController  = nil;
    }
    
    return viewController;
}

- (NSString *)xibFileName
{
    if (_xibFileName) {
        return _xibFileName;
    }
    
    _xibFileName = NSStringFromClass(self.className);
    
    return _xibFileName;
}

- (UIStoryboard *)storyboard
{
    if (_storyboard) {
        return _storyboard;
    }
    
    AppDelegate *appDeleage = [UIApplication sharedApplication].delegate;
    _storyboard = appDeleage.window.rootViewController.storyboard;
    
    return _storyboard;
}

- (NSString *)storyboardID
{
    if (_storyboardID) {
        return _storyboardID;
    }
    
    _storyboardID = NSStringFromClass(self.className);
    
    return _storyboardID;
}
@end

@implementation CGHomeDataModel (CGHomeDataSource)

+ (NSArray <CGHomeDataModel *> *)cg_getHomeDataSourceList
{
    NSMutableArray *dataSourceList  = [NSMutableArray array];
    
    CGHomeDataModel *photoListVC    = [CGHomeDataModel cg_createHomeDataWithClass:[CGPhotoNavigationController class] title:@"浏览相机图片" subtitle:@"本地相机图片，可以选择"];
    photoListVC.showType            = CGShowTypeModel;
    [dataSourceList addObject:photoListVC];
    
    CGHomeDataModel *testDefinesVC  = [CGHomeDataModel cg_createHomeDataWithClass:[CGTestDefinesTableViewController class] title:@"记录观看的宏定义" subtitle:@"记录开发中看见的宏定义说明，有可能存在表格中，也可能日志形式打印"];
    [dataSourceList addObject:testDefinesVC];
    
    CGHomeDataModel *testLayoutConstranintsVC   = [CGHomeDataModel cg_createHomeDataWithClass:[CGTestLayoutConstranintsViewController class] title:@"测试约束" subtitle:@"测试 UIView 扩展文件 UIView+CGAddConstraints.h 功能"];
    [dataSourceList addObject:testLayoutConstranintsVC];
    
    return dataSourceList;
}

@end