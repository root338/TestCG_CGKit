//
//  TestCATranform3DViewController.m
//  TestCG_CGKit
//
//  Created by DY on 16/3/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "TestCATranform3DViewController.h"

#import "UIImage+CGLoadImage.h"
#import "UIView+CGSetupFrame.h"

#import "CGAngleRadianHeader.h"

@interface TestCATranform3DViewController ()
{
    
}

@property (nonatomic, strong) CALayer *testLayer;

@end

@implementation TestCATranform3DViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor   = [UIColor whiteColor];
    CALayer *layer = [CALayer layer];
    
    UIImage *image  = [UIImage cg_loadImageName:@"2" withExtension:@"jpg"];
    layer.contents  = (id)[image CGImage];
    
    CGFloat imageWidth  = self.view.width - 50;
    CGSize imageSize    = CGSizeMake(imageWidth,imageWidth * image.size.height / image.size.width);
    CGPoint origin      = CGPointMake(self.view.center.x - imageSize.width / 2.0, self.view.center.y - imageSize.height / 2.0);
    layer.frame         = (CGRect){origin, imageSize};
    [self.view.layer addSublayer:layer];
    
    layer.allowsEdgeAntialiasing    = YES;
    self.testLayer      = layer;
    
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanRecognizer:)];
    [self.view addGestureRecognizer:pan];
}

- (void)handlePanRecognizer:(UIPanGestureRecognizer *)paramGesture
{
    static CGPoint startPoint;
    
    switch (paramGesture.state) {
        case UIGestureRecognizerStateBegan:
            startPoint  = [paramGesture translationInView:self.view];
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint newPoint = [paramGesture translationInView:self.view];
            
//            CGFloat maxAngle    = 5.0;
//            CGFloat x   = maxAngle / self.view.width;
//            CGFloat moreLine    = ;
//            CGFloat angle       = moreLine * x;
            
            CATransform3D transform = CATransform3DIdentity;
            transform.m34   = -1 / 200.0;
//            transform = CATransform3DMakeTranslation(0, 0, -80);
//            transform.m34           = 500;
            
            transform   = CATransform3DRotate(transform, _CG_RadianForAngle(newPoint.x - startPoint.x), 0, 1, 0);
            
//            transform   =  CATransform3DMakeRotation(0.78, 0, 1, 0);
            self.testLayer.transform    = transform;
//            startPoint = newPoint;
        }
            break;
        default:
            break;
    }
}

@end
