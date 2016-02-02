//
//  DetailViewController.m
//  TestCG_CGKit
//
//  Created by apple on 16/2/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DetailViewController.h"

#import "CGNavigationAppearanceProtocol.h"

#import "CGPrintLogHeader.h"

@interface DetailViewController ()<CGNavigationAppearanceProtocol>

@end

@implementation DetailViewController

- (UIColor *)cg_prefersNavigationBarBackgroundColor
{
    return [UIColor blueColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNeedsStatusBarAppearanceUpdate];
}

@end
