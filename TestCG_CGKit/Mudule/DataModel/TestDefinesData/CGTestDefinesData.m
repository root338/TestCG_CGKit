//
//  CGTestDefinesData.m
//  TestCG_CGKit
//
//  Created by apple on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CGTestDefinesData.h"

#import "NSString+VerificationString.h"

@interface CGTestDefinesData ()

@end

@implementation CGTestDefinesData


- (void)printTestDefinesData
{
    NSLog(@"\n  判断设备相关：\
          \n    是否是iPhone设备：    TARGET_OS_IPHONE    = %i\
          \n    是否是模拟器：         TARGET_OS_SIMULATOR = %i\
          ", TARGET_OS_IPHONE, TARGET_OS_SIMULATOR);
    
    
    NSLog(@"\n  判断系统版本号相关：\
          \n    UIDevice -> systemVersion   = %@    \
          \n    NSFoundationVersionNumber   = %f    \
          ", [[UIDevice currentDevice] systemVersion], NSFoundationVersionNumber);
    
    NSString *link  = @"https://www.apple.com";
    NSLog(@"%@ 是否http:// 链接吗? %i", link, [link verificationIsHTTPPrefix]);
}
@end
