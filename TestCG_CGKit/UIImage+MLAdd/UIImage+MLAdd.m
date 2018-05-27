//
//  UIImage+MLAdd.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/24.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIImage+MLAdd.h"

@implementation UIImage (MLAdd)

+ (UIImage *)ml_drawImageWithConfig:(MLDrawCornerRadiusConfig *)config
{
    
//    UIGraphicsBeginImageContextWithOptions(config.size, config.opaque, config.scale);
//
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    NSString *title = @"Welcome ML ImageView";
//    NSDictionary *mTextAtt = @{
//                               NSFontAttributeName : [UIFont systemFontOfSize:15],
//                               NSForegroundColorAttributeName : [UIColor redColor],
//                               };
//
//    CGRect textFrame = [title boundingRectWithSize:config.size options:NSStringDrawingUsesLineFragmentOrigin attributes:mTextAtt context:nil];
//    CGRect drawRect = CGRectMake((config.size.width - CGRectGetWidth(textFrame)) / 2.0, 20, CGRectGetWidth(textFrame), CGRectGetHeight(textFrame));
//
//    [title drawWithRect:drawRect options:NSStringDrawingUsesLineFragmentOrigin attributes:mTextAtt context:nil];
//
//
//    CGContextTranslateCTM(context, 0, config.size.height);
//    CGContextScaleCTM(context, 1.0, -1.0);
//
//    UIImage *img = [UIImage imageNamed:@"01"];
//    CGContextDrawImage(context, CGRectMake(CGRectGetMaxX(drawRect) + 5, config.size.height - CGRectGetHeight(drawRect) / 2 - CGRectGetMinY(drawRect) - img.size.height / 2, img.size.width, img.size.height), img.CGImage);
//
//    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, 0, 10);
//
//    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
//    CGContextDrawPath(context, kCGPathStroke);
//
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//
//    UIGraphicsEndImageContext();
//
//    return image;
    return nil;
}
    
@end
