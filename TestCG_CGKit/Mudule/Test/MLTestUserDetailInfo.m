//
//  MLTestUserDetailInfo.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLTestUserDetailInfo.h"

#define MLUSERINFO_PRIVATE_PROPERTY
#import "MLUserInfoHeader.h"

@interface MLTestUserDetailInfo ()
{
    
}
@property (nonatomic, strong) NSString *password;

@end

@implementation MLTestUserDetailInfo

@dynamic password;
- (instancetype)init
{
    self = [super init];
    if (self) {
//        MLTestUserInfo *user = [[MLTestUserInfo alloc] init];
    }
    return self;
}

@end
