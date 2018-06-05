//
//  MLTestUserInfo.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLTestUserInfo.h"

#define MLUSERINFO_PRIVATE_PROPERTY
#import "MLUserInfoHeader.h"


@implementation MLTestUserInfo

- (instancetype)initWithUserName:(NSString *)userName password:(NSString *)password
{
    self = [super init];
    if (self) {
        _userName   = userName;
        _password   = password;
    }
    return self;
}

@end
