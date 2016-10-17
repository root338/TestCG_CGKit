//
//  CGTestDrawImageViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/10/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestDrawImageViewController.h"

#import "UIView+CGSetupFrame.h"
#import "UIView+CGAddConstraints.h"

#import "UIImage+CGDrawIcon.h"
#import "CGArrowIconConfig.h"

@interface CGTestDrawImageViewController ()
{
    CGArrowIconConfig *config;
    NSInteger a;
    UIImageView *imageView;
    NSTimer *time;
}
@end

@implementation CGTestDrawImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    a           = 1;
    imageView   = [[UIImageView alloc] init];
    [self.view addSubview: imageView];
    [imageView cg_autoEdgesInsetsZeroToViewController:self];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (time == nil) {
//        time    = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(handleTime:) userInfo:nil repeats:YES];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if (time) {
        [time invalidate];
    }
}

- (void)handleTime:(NSTimer *)timer {
    
    if (config == nil) {
        
        config    = [CGArrowIconConfig defaultArrowConfig];
        config.size                    = CGSizeMake(self.view.width, self.view.height - 64);
        config.angle                   = 180;
        config.arrowVertexOrientationType  = CGOrientationTypeUp;
    }else {
        
        config.angle += 5 * a;
        if (config.angle > 180) {
            a = -1;
        }
        if (config.angle <= 1) {
            a = 1;
        }
    }
    
    UIImage *image = [UIImage drawArrowWithConfig:config];
    [imageView setImage:image];
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
