//
//  MLTestUserInfo.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>



/**
 存储用户的基本信息
 @brief <#content#>方法简介
 @discussion <#content#>这是存储用户信息的类
 @author <#content#>MLKit
 @date <#content#>2018.6.2
 @version <#content#>1.0
 @bug <#content#>
 @code <#content#>
 @warning <#content#>
 @note <#content#>
 
 
 */
@interface MLTestUserInfo : NSObject

@property (nonatomic, strong, readonly) NSString *userName NS_UNAVAILABLE;

- (instancetype)initWithUserName:(NSString *)userName password:(NSString *)password; //API_UNAVAILABLE(ios) ;

@end
