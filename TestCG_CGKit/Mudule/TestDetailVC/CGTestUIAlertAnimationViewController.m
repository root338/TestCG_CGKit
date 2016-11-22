//
//  CGTestUIAlertAnimationViewController.m
//  TestCG_CGKit
//
//  Created by DY on 2016/11/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestUIAlertAnimationViewController.h"

#import "UIViewController+CGAlert.h"

#import "UIView+CGAddConstraints.h"

#import "NSObject+CGExchangeSelector.h"

#import "CGSelectorLayerView.h"

@interface CGTestUIAlertAnimationViewController ()
{
    CGSelectorLayerView *_selectorLayerView;
}

@end

@implementation CGTestUIAlertAnimationViewController

- (void)handleShowAlertView:(id)sender
{
    if (_selectorLayerView == nil) {
        
        UIView *targetSuperview = self.navigationController.view;
        
        _selectorLayerView  = [[CGSelectorLayerView alloc] initWithFrame:targetSuperview.bounds];
        _selectorLayerView.contentView.size = CGSizeMake(200, 200);
        _selectorLayerView.contentView.center   = _selectorLayerView.center;
        _selectorLayerView.contentView.backgroundColor  = [UIColor orangeColor];
        _selectorLayerView.targetSuperview      = targetSuperview;
    }
    
    [_selectorLayerView show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button    = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"show AlertView" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(handleShowAlertView:) forControlEvents:UIControlEventTouchUpInside];
    [button cg_autoEdgesToViewController:self withInsets:UIEdgeInsetsMake(15, 15, 0, 15)  exculdingEdge:CGLayoutEdgeBottom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


@implementation CALayer (CGTestLayer)

+ (void)load
{
    [super load];
    [CALayer cg_exchangeInstanceMethodWithOriginalselector:@selector(addAnimation:forKey:) swizzledSelector:@selector(cg_addAnimation:forKey:)];
}

- (void)cg_addAnimation:(CAAnimation *)anim forKey:(NSString *)key
{
    [self cg_addAnimation:anim forKey:key];
}

@end
