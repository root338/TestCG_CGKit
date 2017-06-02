//
//  CGTestTitleBarViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/8/18.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestTitleBarViewController.h"

#import "CGLabel.h"
#import "CGButton.h"

#import "UIView+CGAddConstraints.h"
#import "UIView+CGSetupAppearance.h"

@implementation CGTestTitleBarViewController

- (void)viewDidLoad
{
    self.backItemImage   = [UIImage imageNamed:@"01"];
    [super viewDidLoad];
    
    self.view.backgroundColor   = [UIColor orangeColor];
    
    CGButton *button    = [CGButton createButtonWithType:UIButtonTypeSystem style:CGButtonStyleHorizonalLeft space:10 title:@"button title" font:[UIFont systemFontOfSize:15] titleColor:[UIColor blueColor] image:[UIImage imageNamed:@"01"]];
    button.marginEdgeInsets     = UIEdgeInsetsMake(10, 10, 10, 10);
    button.layer.borderColor    = [UIColor redColor].CGColor;
    button.layer.borderWidth    = 1;
    [self.view addSubview:button];
    [button cg_autoCenterToSuperview];
    
    CGLabel *label  = [[CGLabel alloc] init];
    label.numberOfLines = 0;
//    label.preferredMaxLayoutWidth   = 200;
    label.text  = @"当雷锋精神动力飞机的酸辣粉加微哦 v 多了；啊额吉乐山大佛精神动力飞机上了飞机上了大年初六是颠鸾倒凤加了几分为减肥哦发了几分流口水的肌肤轮廓为减肥论文就流口水的处理技术的 v 额外积分配哦飞机拍摄道具的 v路上看到就烦死了都快飞机失联客机分配我饿减肥 v 你送饭唯饭无聊就饿了但是开发的飞机老师的看法";
    [self.view addSubview:label];
    
    [label cg_setupBorderWithWidth:1 color:[UIColor blueColor]];
    [label cg_autoCenterToSuperview];
}

@end
