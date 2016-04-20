//
//  CGTestWKWebViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/4/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestWKWebViewController.h"
#import "CGWebView.h"

@interface CGTestWKWebViewController ()

@end

@implementation CGTestWKWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.webView cg_setupURLForString:@"http://www.baidu.com"];
}

@end
