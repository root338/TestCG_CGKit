//
//  MLDraw+DrawCanvas.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDraw+DrawCanvas.h"

#import "MLDrawError.h"
#import "MLDrawResult.h"
#import "MLDrawCanvasRule.h"
#import "MLDraw+AddCanvas.h"

@implementation MLDraw (DrawCanvas)

+ (MLDrawResult *)drawWithRule:(id<MLDrawCanvasRule>)rule drawBlock:(MLDrawBlock)drawBlock
{
    
    MLDrawResult *drawResult = nil;
    
    MLDrawError *error = nil;
    [MLDraw generateCanvasWithRule:rule error:&error];
    
    if (error != nil) {
        drawResult = [[MLDrawResult alloc] initWithError:error];
        return drawResult;
    }
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (drawBlock) {
        error = drawBlock(currentContext);
    }
    
    if (error == nil) {
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        drawResult = [[MLDrawResult alloc] initWithImage:image];
    }
    
    if (drawResult == nil) {
        drawResult = [[MLDrawResult alloc] initWithError:error];
    }
    
    [self endCanvas];
    
    return drawResult;
}

+ (void)asyncDrawWithRule:(id<MLDrawCanvasRule>)rule drawBlock:(MLDrawBlock)drawBlock resultCallback:(MLDrawResultCallback)resultCallback
{
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        
        MLDrawResult *result = [self drawWithRule:rule drawBlock:drawBlock];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (resultCallback) {
                resultCallback(result);
            }
        });
    });
}

@end
