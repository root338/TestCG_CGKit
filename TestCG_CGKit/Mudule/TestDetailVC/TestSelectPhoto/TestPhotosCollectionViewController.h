//
//  TestPhotosCollectionViewController.h
//  TestCG_CGKit
//
//  Created by DY on 16/2/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALAsset;

NS_ASSUME_NONNULL_BEGIN

@interface TestPhotosCollectionViewController : UICollectionViewController

@property (nullable, nonatomic, strong) NSArray *photosListDataSource;

+ (instancetype)createDefaultCollectionViewControllerWithDataSource:(nullable NSArray<ALAsset *> *)dataSource;

@end
NS_ASSUME_NONNULL_END