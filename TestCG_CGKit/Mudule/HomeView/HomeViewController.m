//
//  HomeViewController.m
//  TestCG_CGKit
//
//  Created by apple on 15/12/5.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "UIView+CGSetupFrame.h"

//#import "TestTableViewController.h"
#import "UIView+CGSetupAppearance.h"
#import "CGLineBoxLayerView.h"

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
    
    CGLineBoxLayerView *layerView = [[CGLineBoxLayerView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    layerView.backgroundColor = [UIColor orangeColor];
    [layerView cg_setupBorderWithWidth:1 color:[UIColor redColor]];
    [self.view addSubview:layerView];
}

- (void)handleTapRecognizer:(UITapGestureRecognizer *)gesture
{
    
}

- (IBAction)pushTestDetailVC:(id)sender
{
//    TestTableViewController *tableViewVC = [[TestTableViewController alloc] init];
//    [self.navigationController pushViewController:tableViewVC animated:YES];
}

@end
