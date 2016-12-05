//
//  CGTestWKWebViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/4/20.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestWKWebViewController.h"

#import "CGWebView.h"
#import "CGAlertController.h"

@interface CGTestWKWebViewController ()
{
    
}

@end

@implementation CGTestWKWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webView loadRequestWithURLString:@"https://wwws.yuemei.com/api/test/aa.php"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

@end
