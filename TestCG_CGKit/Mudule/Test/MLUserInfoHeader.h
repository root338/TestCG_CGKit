//
//  MLUserInfoHeader.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#ifdef MLUSERINFO_PRIVATE_PROPERTY

#ifndef MLUserInfoHeader_h
#define MLUserInfoHeader_h

#import "MLTestUserInfo.h"

@interface MLTestUserInfo ()

@property (nonatomic, strong) NSString *password;

@end

#endif /* MLUserInfoHeader_h */

#else

#error 这个头文件只能在 MLTestUserInfo 的子类或扩展中使用

#endif
