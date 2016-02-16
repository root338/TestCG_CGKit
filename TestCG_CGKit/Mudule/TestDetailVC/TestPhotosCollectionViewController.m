//
//  TestPhotosCollectionViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/2/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TestPhotosCollectionViewController.h"

#import "UIEdgeInsets+Category.h"

#import "UICollectionView+CGRegisterCell.h"
#import "UICollectionView+CGDequeueReusableCell.h"

#import "TestPhotosCollectionViewCell.h"

#import <AssetsLibrary/AssetsLibrary.h>

@implementation TestPhotosCollectionViewController

+ (instancetype)createDefaultCollectionViewControllerWithDataSource:(NSArray *)dataSource
{
    UICollectionViewFlowLayout *flowLayout  = [[UICollectionViewFlowLayout alloc] init];
    
    CGRect screen   = [UIScreen mainScreen].bounds;
    
    CGFloat count   = 4;
    CGFloat space   = 2.0;
    CGFloat margin  = 2.0;
    CGFloat lenght  = (CGRectGetWidth(screen) - (count - 1) * space - margin * 2) / count;
    CGSize  itemSize    = CGSizeMake(lenght, lenght);
    flowLayout.itemSize = itemSize;
    flowLayout.minimumInteritemSpacing  = space;
    flowLayout.minimumLineSpacing       = space;
    flowLayout.sectionInset             = UIEdgeInsetsMakeAllEqualValue(margin);
    
    TestPhotosCollectionViewController *photosCollectionVC  = [[TestPhotosCollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
    photosCollectionVC.photosListDataSource = dataSource;
    
    [photosCollectionVC.collectionView cg_registerReuseClass:[TestPhotosCollectionViewCell class]];
    
    return photosCollectionVC;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photosListDataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TestPhotosCollectionViewCell *cell = [collectionView cg_dequeueReusableCellWithReuseClass:[TestPhotosCollectionViewCell class] forIndexPath:indexPath];
    
    ALAsset *asset          = self.photosListDataSource[indexPath.row];
    cell.imageView.image    = [UIImage imageWithCGImage:asset.thumbnail];
    return cell;
}
@end
