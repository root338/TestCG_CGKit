//
//  MLDraw+DrawCanvas.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDraw.h"

NS_ASSUME_NONNULL_BEGIN

@class MLDrawResult, MLDrawError;
@protocol MLDrawCanvasRule;

typedef MLDrawError * _Nullable  (^MLDrawBlock) (CGContextRef currentContext);
typedef void (^MLDrawResultCallback) (MLDrawResult *result);

@interface MLDraw (DrawCanvas)

+ (MLDrawResult *)drawWithRule:(id<MLDrawCanvasRule>)rule drawBlock:(MLDrawBlock)drawBlock;
+ (void)asyncDrawWithRule:(id<MLDrawCanvasRule>)rule drawBlock:(MLDrawBlock)drawBlock resultCallback:(MLDrawResultCallback)resultCallback;

@end
NS_ASSUME_NONNULL_END
