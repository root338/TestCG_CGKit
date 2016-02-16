//
//  HomeViewController.m
//  TestCG_CGKit
//
//  Created by apple on 15/12/5.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "HomeViewController.h"

#import "DetailViewController.h"

#import "UIView+CGSetupFrame.h"
#import "UIView+CGSetupAppearance.h"

#import "CGButton.h"
#import "CGLineBoxLayerView.h"

#import "UIApplication+CGVerificationRemoteNotification.h"

#import "UIView+CGScaleView.h"
#import "UIView+CGLineMoveView.h"
#import "UIView+CGScaleViewFromOverlayView.h"

#import "CGAssetsFilterObject.h"
#import "CGAssetsLibraryManager.h"

#import "TestPhotosCollectionViewController.h"

#import "CGPrintLogHeader.h"

@interface HomeViewController ()
{
    BOOL isShow;
    
    CGLineMoveViewType  lineMoveViewType;
    CGScaleViewType     scaleViewType;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeight;

@property (nullable, nonatomic, strong) UIView *testView;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    CGBaseLayerView *borderView = [[CGBaseLayerView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapRecognizer:)];
//    [borderView addGestureRecognizer:tap];
//    [self.view addSubview:borderView];
//    
//    UIColor *redColor       = [UIColor redColor];
//    UIColor *blueColor      = [UIColor blueColor];
//    UIColor *orangeColor    = [UIColor orangeColor];
//    UIColor *greenColor     = [UIColor greenColor];
//    [borderView setViewWithBorderColor:redColor borderWidth:1 state:CGViewBorderStateHighlighted];
//    [borderView setViewWithBorderColor:blueColor borderWidth:1 state:CGViewBorderStateDisabled];
//    [borderView setViewWithBorderColor:orangeColor borderWidth:1 state:CGViewBorderStateNormal];
//    [borderView setViewWithBorderColor:greenColor borderWidth:1 state:CGViewBorderStateSelected];
//    
////    [borderView cg_setupBorderWithWidth:1 color:redColor];
//    self.layerView = borderView;
//    self.contentViewHeight.constant = self.view.height;
//    self.contentViewWidth.constant  = self.view.width;
    
//    CGLineBoxLayerView *layerView = [[CGLineBoxLayerView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
//    layerView.backgroundColor = [UIColor orangeColor];
//    [layerView cg_setupBorderWithWidth:1 color:[UIColor redColor]];
//    [self.view addSubview:layerView];
//    
//    [UIApplication cg_verifyUserOpenRemoteNotification];
    
    CGButton *button = [CGButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"test button" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"01"] forState:UIControlStateNormal];
    button.buttonStyle  = CGButtonStyleHorizonalRight;
    button.space        = 8;
    button.marginEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8);
    [button sizeToFit];
    button.origin = CGPointMake(100, 200);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor  = [UIColor lightGrayColor];
    
    UIView *testView            = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    testView.backgroundColor    = [UIColor orangeColor];
    self.testView               = testView;
    
    
    lineMoveViewType            = CGLineMoveViewTypeBottom;
    scaleViewType               = CGScaleViewTypeTopVertex;
    
//    [self.view addSubview:testView];
}

- (void)handleButtonEvent:(UIButton *)button
{
    CGPoint offsetPoint = CGPointMake(0, 5);
    if (!self.testView.superview) {
        [self.view addSubview:self.testView];
    }
    if (isShow) {
        [self.testView cg_dismissScaleWithOverlayView:button type:scaleViewType offsetPoint:offsetPoint];
        scaleViewType++;
        if (scaleViewType > CGScaleViewTypeRightTopVertex) {
            scaleViewType = CGScaleViewTypeTopVertex;
        }
        isShow = NO;
    }else {
        self.testView.frame = CGRectMake(100, 100, 100, 40);
        [self.testView cg_showScaleWithOverlayView:button type:scaleViewType offsetPoint:offsetPoint];
        isShow  = YES;
    }
}

- (void)handleTapRecognizer:(UITapGestureRecognizer *)gesture
{
    
}

- (IBAction)pushTestDetailVC:(id)sender
{
//    DetailViewController *vc    = [[DetailViewController alloc] init];
//    vc.title                = @"内容页";
//    vc.view.backgroundColor = [UIColor orangeColor];
//    [self.navigationController pushViewController:vc animated:YES];
    
    CGAssetsLibraryManager *assetsLibraryManager    = [CGAssetsLibraryManager sharedManager];
    
    CGAssetsFilterObject *filterObj = [[CGAssetsFilterObject alloc] init];
    filterObj.assetsGroupType       = ALAssetsGroupSavedPhotos;
    filterObj.assetsSequenceType    = CGAssetsSequenceTypeAscending;
    
    [assetsLibraryManager cg_assetsListWithAssetsFilter:filterObj assetList:^(NSArray<ALAsset *> * _Nullable paramAssetList) {
        TestPhotosCollectionViewController *photosCollectionVC   = [TestPhotosCollectionViewController createDefaultCollectionViewControllerWithDataSource:paramAssetList];
        [self presentViewController:photosCollectionVC animated:YES completion:nil];
    } failureBlock:nil];
}

@end
