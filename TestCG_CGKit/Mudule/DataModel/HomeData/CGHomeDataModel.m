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

#import "CGPhotoListViewController.h"
#import "CGPhotoNavigationController.h"

@implementation CGHomeDataModel

+ (instancetype)cg_createHomeDataWithClass:(Class)paramClass
{
    return [self cg_createHomeDataWithClass:paramClass title:nil subtitle:nil];
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
    
    if (![viewController isKindOfClass:[UIViewController class]]) {
        viewController  = nil;
    }
    
    viewController.title    = self.title;
    
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
    
    CGHomeDataModel *photoListVC    = [CGHomeDataModel cg_createHomeDataWithClass:[CGPhotoListViewController class] title:@"浏览相机图片" subtitle:@"本地相机图片，可以选择"];
    
    [dataSourceList addObject:photoListVC];
    
    return dataSourceList;
}

@end