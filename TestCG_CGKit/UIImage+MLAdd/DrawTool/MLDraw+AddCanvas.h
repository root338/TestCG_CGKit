//
//  MLDraw+AddCanvas.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDraw.h"

NS_ASSUME_NONNULL_BEGIN

@class MLDrawError;

@interface MLDraw (AddCanvas)

/// 在 UIGraphicsBeginImageContextWithOptions 正确生成绘图上下文后，在结束时需要手动调用 endCanvas
+ (void)generateCanvasWithRule:(id<MLDrawCanvasRule>)rule error:(MLDrawError *_Nullable* _Nullable )error;
+ (void)endCanvas;

@end

NS_ASSUME_NONNULL_END
