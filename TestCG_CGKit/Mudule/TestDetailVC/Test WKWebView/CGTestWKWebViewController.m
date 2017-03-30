//
//  CGTestWKWebViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/4/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestWKWebViewController.h"

#import "CGAlertController.h"

#import "CGWebView.h"

#import "TestCG_CGKit-Swift.h"

@interface CGTestWKWebViewController ()
{
    
}

@end

@implementation CGTestWKWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webView loadRequestWithURLString:@"https://www.apple.com"];
    
    [[CGURLSessionManager sessionManager] requestWithUrlString:@"https://www.apple.com"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

@end
