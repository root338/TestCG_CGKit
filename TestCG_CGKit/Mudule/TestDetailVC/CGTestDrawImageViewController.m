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

#import "YMDiaryPostsCellManager.h"

#import "UILabel+MLCreate.h"

#import "MLDraw+AddPath.h"
#import "MLDrawFilletRule.h"

@interface CGTestDrawImageViewController ()
{
    
}
@end

@implementation CGTestDrawImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self testDraw];
    
//    [self testDrawYMDiaryPostsCell];
    
    [self testCATestLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testCATestLayer
{
    MLDrawFilletRule *rule  = [[MLDrawFilletRule alloc] init];
    rule.filletRect         = CGRectMake(0, 0, 100, 50);
//    rule.cornerRadius       = 25;
    rule.lineStrokeColor    = [UIColor redColor];
    rule.lineWidth          = 1;
    rule.lineFillColor      = [UIColor orangeColor];
    
    UIGraphicsBeginImageContextWithOptions(rule.filletRect.size, NO, 2);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [MLDraw drawFilletWithRule:rule context:currentContext];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    CALayer *layer = [CALayer layer];
    layer.contentsScale = 2;
    layer.contentsGravity = kCAGravityCenter;
    layer.contents  = (__bridge id)image.CGImage;
    layer.frame = CGRectMake(100, 100, 100, 50);
    
    [self.view.layer addSublayer:layer];
    
    CALayer *testLayer      = [CALayer layer];
    testLayer.cornerRadius  = 25;
    testLayer.contentsScale = 2;
    testLayer.borderColor   = [UIColor redColor].CGColor;
    testLayer.borderWidth   = 1;
    testLayer.frame         = CGRectMake(100, 160, 100, 50);
    testLayer.contents      = (__bridge id)image.CGImage;
    testLayer.masksToBounds = YES;
    [self.view.layer addSublayer:testLayer];
    
//    UILabel *label = UILabel.create().ml_numberOfLines(1).ml_alignment(NSTextAlignmentCenter).ml_borderColor([UIColor orangeColor]).ml_borderWidth(1);
//    label.numberOfLines = 3;
//
//    NSString *str = @"ldsj里发生的减肥路上看到加夫里什独家发售蓝灯房间里看电视剧历史的减肥了多少减肥路上的距离里发生的减肥了肯定是佛教历史的房间收到代理房间里看电视剧粉丝掉了附近乐山大佛";
//    UIFont *font = [UIFont systemFontOfSize:12];
//    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//    style.lineSpacing = 5 + font.lineHeight - font.pointSize;
//    NSDictionary *dict = @{
//                           NSFontAttributeName : font,
//                           NSForegroundColorAttributeName : [UIColor blackColor],
//                           NSParagraphStyleAttributeName : style,
//                           };
//    NSAttributedString *att = [[NSAttributedString alloc] initWithString:str attributes:dict];
//    label.attributedText = att;
//
//    CGRect textRect = [att boundingRectWithSize:CGSizeMake(180, 50) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
//
//    label.frame = CGRectMake(100, 100, CGRectGetMaxX(textRect), CGRectGetMaxY(textRect));
//
//    [self.view addSubview:label];
//    label.backgroundColor = [UIColor redColor];
//    CATextLayer *textLayer = [CATextLayer layer];
//    textLayer.contentsScale = [UIScreen mainScreen].scale;
//    NSString *text = @"世界为此而改fjldfjldsjfdsfjsdlkfjdslkfjdslfjdslfkjdslfdjdlskfjdlsjfdlkjlskdfjlksdjfldskfjlsdjflksdjflksdjflksdjflkdsjflkdsfjldskfjldskjfsdlkfjsdlkfjsdlfsjd这是一个虚拟的世界";
//    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
////    style.lineBreakMode = NSLineBreakByTruncatingTail;
//    style.lineSpacing   = 10;
//    style.minimumLineHeight = 17;
//    style.maximumLineHeight = 20;
//    NSDictionary *attDic = @{
//                             NSFontAttributeName : [UIFont systemFontOfSize:12],
//                             NSForegroundColorAttributeName : [UIColor redColor],
//                             NSParagraphStyleAttributeName : style,
//                             };
//    NSAttributedString *att = [[NSAttributedString alloc] initWithString:text attributes:attDic];
//    textLayer.string = att;
//    textLayer.wrapped   = YES;
//    textLayer.fontSize  = 10;
//    textLayer.alignmentMode = kCAAlignmentNatural;
//    textLayer.truncationMode = kCATruncationEnd;
//    textLayer.frame     = CGRectMake(100, 100, 200, 50);
//    [self.view.layer addSublayer:textLayer];
//    textLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
}

- (void)testDrawYMDiaryPostsCell
{
    YMDiaryPostsCellManager *cellManager = [[YMDiaryPostsCellManager alloc] init];
    [cellManager getDiaryPostsContentImageWithData:nil layout:[cellManager createCellLayoutWithData:nil width:self.view.width] completion:^(UIImage *image) {
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 100, image.size.width, image.size.height);
        layer.contents  = (__bridge id) image.CGImage;
        
        [self.view.layer addSublayer:layer];
    }];
}

- (void)testDraw
{
    
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, rule.size.width, rule.size.height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(rule.cornerRadius, rule.cornerRadius)];
//    [bezierPath addClip];
//    bezierPath.lineWidth    = rule.borderWidth * 2;
    
    
//
}

 
@end
