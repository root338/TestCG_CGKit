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

#import "MLFramePathTool.h"
#import "MLDrawFrameRule.h"

#import "YMDiaryPostsCellManager.h"

#import "UILabel+MLCreate.h"

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
    UILabel *label = UILabel.create();
    label.numberOfLines = 3;
    
    NSString *str = @"ldsj里发生的减肥路上看到加夫里什独家发售蓝灯房间里看电视剧历史的减肥了多少减肥路上的距离里发生的减肥了肯定是佛教历史的房间收到代理房间里看电视剧粉丝掉了附近乐山大佛";
    UIFont *font = [UIFont systemFontOfSize:12];
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineSpacing = 5 + font.lineHeight - font.pointSize;
    NSDictionary *dict = @{
                           NSFontAttributeName : font,
                           NSForegroundColorAttributeName : [UIColor blackColor],
                           NSParagraphStyleAttributeName : style,
                           };
    NSAttributedString *att = [[NSAttributedString alloc] initWithString:str attributes:dict];
    label.attributedText = att;
    
    CGRect textRect = [att boundingRectWithSize:CGSizeMake(180, 50) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    label.frame = CGRectMake(100, 100, CGRectGetMaxX(textRect), CGRectGetMaxY(textRect));
    
    [self.view addSubview:label];
    label.backgroundColor = [UIColor redColor];
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
    
    MLDrawFrameRule *rule = [[MLDrawFrameRule alloc] init];
    rule.size = CGSizeMake(self.view.width - 40, 580);
    rule.lineColor    = [[UIColor redColor] colorWithAlphaComponent:0.6];
    rule.lineWidth    = 50;
    rule.cornerRadius   = 50;
    rule.corners   = UIRectCornerAllCorners;
    UIGraphicsBeginImageContextWithOptions(rule.size, rule.opaque, rule.scale);
    
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, rule.size.width, rule.size.height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(rule.cornerRadius, rule.cornerRadius)];
//    [bezierPath addClip];
//    bezierPath.lineWidth    = rule.borderWidth * 2;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    MLDrawFrameRule *borderRule = [rule copy];
    borderRule.lineWidth        = 1 / [UIScreen mainScreen].scale;
    
    CGPathRef borderPathRef = [MLFramePathTool createPathWithPathRule:borderRule error:nil];
    CGContextAddPath(context, borderPathRef);
    CGContextClip(context);
    
    CGPathRef path = [MLFramePathTool createPathWithPathRule:rule error:nil];
    CGContextAddPath(context, path);

    CGContextSetLineWidth(context, rule.lineWidth * 2);
    [rule.lineColor setStroke];
    
    CGContextDrawPath(context, kCGPathStroke);
    
    NSString *text = @"飞机失联飞机上的雷锋精神的浪费地方收到了附近的酸辣粉绝对是雷锋精神的来访记录的是分离的时间了附近的是雷锋精神的来访绝世独立减肥路上的风景时对方脸上的肌肤里的时间发来的是分离的身份";
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineSpacing = 10;
    NSDictionary *mTextDic = @{
                               NSFontAttributeName : [UIFont systemFontOfSize:15],
                               NSForegroundColorAttributeName : [UIColor blackColor],
                               NSParagraphStyleAttributeName : style,
                               };
    CGRect textFrame = [text boundingRectWithSize:CGSizeMake(rule.size.width - 100, 300) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:mTextDic context:nil];
    textFrame.origin = CGPointMake(30, 30);
    [text drawInRect:textFrame withAttributes:mTextDic];
    
//    [bezierPath stroke];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
//    CGPathRelease(path);
    
    UIGraphicsEndImageContext();
    
    CALayer *layer = [CALayer layer];
    
    layer.frame     = CGRectMake(20, 80, rule.size.width, rule.size.height);
    layer.contents = (__bridge id _Nullable)(image.CGImage);
    
    CALayer *testLayer      = [CALayer layer];
    testLayer.frame         = layer.frame;
    testLayer.cornerRadius  = rule.cornerRadius;
    testLayer.masksToBounds = YES;
    testLayer.borderColor   = [[UIColor blackColor] colorWithAlphaComponent:0.7].CGColor;
    testLayer.borderWidth   = rule.lineWidth;
    
    CALayer *testRectLayer  = [CALayer layer];
    testRectLayer.frame     = layer.frame;
    testRectLayer.borderColor = [[UIColor blueColor] colorWithAlphaComponent:0.7].CGColor;
    testRectLayer.borderWidth = 0.5;
    
    [self.view.layer addSublayer:testLayer];
    [self.view.layer addSublayer:layer];
    [self.view.layer addSublayer:testRectLayer];
//
}

 
@end
