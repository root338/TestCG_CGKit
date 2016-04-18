//
//  CGTestPhotosViewController.m
//  TestCG_CGKit
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestPhotosViewController.h"

#import "CGImageManager.h"
#import <Photos/Photos.h>

@interface CGTestPhotosViewController ()

@end

@implementation CGTestPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self cgtest_PHCollection];
    [self cgtest_PHAssetCollection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Test PHCollection

//对PHFetchOptions的一些说明，理解
/** 
 PHFetchOptions 对相册，照片进行有条件查找、并进行排序
 
 一些属性的解释：
    predicate               :查找满足条件的内容
    sortDescriptors         :对结果进行排序
    includeHiddenAssets     : 是否包含隐藏的
    includeAllBurstAssets   : 是否包含连拍的
    includeAssetSourceTypes : 资源包含的类型   用户相册、iCloud共享、iTunes同步  @warning iOS 9 and later
    fetchLimit              : 设置结果获取的最大数目，0表示没有限制   @warning iOS 9 and later
    wantsIncrementalChangeDetails   : 获取修改后的详细信息? 以后再看具体意思吧
 */

/** 
 PHFetchResult  查找到的结果
 用法和数组相似呢
 */

//测试 PHCollection

- (void)cgtest_PHCollection
{
    PHFetchResult<PHCollection *> *collectionFetchResult = [PHCollection fetchTopLevelUserCollectionsWithOptions:nil];
    [collectionFetchResult enumerateObjectsUsingBlock:^(PHCollection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
    }];
}

//测试 PHAssetCollection
- (void)cgtest_PHAssetCollection
{
    PHFetchResult<PHAssetCollection *> *assetCollectionFetchResult  = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil];
    
    [assetCollectionFetchResult enumerateObjectsUsingBlock:^(PHAssetCollection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
    }];
}

//测试 PHCollectionList
- (void)cgtest_PHCollectionList
{
    PHFetchResult<PHCollectionList *> *collectionListFetchResult    = [PHCollectionList fetchCollectionListsWithType:PHCollectionListTypeFolder subtype:PHCollectionListSubtypeRegularFolder options:nil];
    [collectionListFetchResult enumerateObjectsUsingBlock:^(PHCollectionList * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
