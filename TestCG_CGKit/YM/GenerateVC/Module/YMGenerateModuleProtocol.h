//
//  YMGenerateModuleProtocol.h
//  QuickAskCommunity
//
//  Created by apple on 2018/6/6.
//  Copyright © 2018年 ym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YMGenerateModuleItem.h"

@protocol YMGenerateModuleProtocol <NSObject>

@required
@property (nonatomic, class, readonly) NSString *moduleName;
+ (nullable UIViewController *)generateMuduleVCWithItem:(YMGenerateModuleItem *)item;

@end
