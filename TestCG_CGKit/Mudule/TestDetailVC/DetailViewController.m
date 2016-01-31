//
//  DetailViewController.m
//  TestCG_CGKit
//
//  Created by apple on 16/2/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "DetailViewController.h"

#import "CGNavigationAppearanceProtocol.h"

@interface DetailViewController ()<CGNavigationAppearanceProtocol>

@end

@implementation DetailViewController

#pragma mark - CGNavigationAppearanceProtocol
//- (BOOL)cg_prefersNavigationBarHidden
//{
//    return YES;
//}

- (UIColor *)cg_prefersNavigationBarBackgroundColor
{
    return [UIColor blueColor];
}

@end
