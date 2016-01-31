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

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeight;

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
    button.buttonStyle  = CGButtonStyleHorizonalLeft;
    button.contentAlignment = CGButtonContentAlignmentBottom;
    button.space        = 8;
    button.marginEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8);
//    button.size     = CGSizeMake(200 , 200);
    [button sizeToFit];
    button.origin = CGPointMake(100, 200);
    [self.view addSubview:button];
}

- (void)handleTapRecognizer:(UITapGestureRecognizer *)gesture
{
    
}

- (IBAction)pushTestDetailVC:(id)sender
{
    DetailViewController *vc    = [[DetailViewController alloc] init];
    vc.title                = @"内容页";
    vc.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
