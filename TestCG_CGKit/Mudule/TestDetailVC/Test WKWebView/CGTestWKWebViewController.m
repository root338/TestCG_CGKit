//
//  CGTestWKWebViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/4/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestWKWebViewController.h"

#import "CGWebView.h"
#import "UIView+CGAddConstraints.h"

@interface CGTestWKWebViewController ()<CGWebViewDelegate>
{
    CGWebView<UIWebView *> *_webView;
}

@end

@implementation CGTestWKWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _webView    = [[CGWebView alloc] initWithWebViewType:CGWebViewTypeWKWebView];
    [self.view addSubview:_webView];
    [_webView cg_autoEdgesInsetsZeroToSuperview];
    
    _webView.delegate   = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    [self.webView setupURLForString:@"http://www.baidu.com"];
    
    [_webView.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/"]]];
}

#pragma mark - CGWebViewDelegate
- (void)cg_webView:(CGWebView *)webView updateProgress:(CGFloat)progress
{
    NSLog(@"%f", progress);
}

- (void)cg_webView:(CGWebView *)webView webViewTitle:(NSString *)webViewTitle
{
    self.title  = webViewTitle;
}

@end
