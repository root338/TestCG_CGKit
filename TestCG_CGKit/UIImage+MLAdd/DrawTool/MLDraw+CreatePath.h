//
//  MLDraw+CreatePath.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDraw.h"

@protocol MLDrawFilletRule;

@interface MLDraw (CreatePath)

+ (UIBezierPath *)createFilletWithRule:(id<MLDrawFilletRule>)rule;

@end
