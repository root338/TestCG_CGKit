//
//  CGTestDrawImageViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/10/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestDrawImageViewController.h"

#import "UIView+CGAddConstraints.h"

#import "UIImage+CGDrawIcon.h"
#import "CGArrowIconConfig.h"

@interface CGTestDrawImageViewController ()

@end

@implementation CGTestDrawImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGArrowIconConfig   *arrowConfig    = [CGArrowIconConfig defaultArrowConfig];
    arrowConfig.angle                   = 80;
    UIImage *image = [UIImage drawArrowWithConfig:arrowConfig];
    UIImageView *imageView  = [[UIImageView alloc] initWithImage:image];
    
    [self.view addSubview: imageView];
    
    [imageView cg_autoCenterToSuperviewWithAxis:CGAxisVertical];
    [imageView cg_topLayoutGuideOfViewController:self];
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
