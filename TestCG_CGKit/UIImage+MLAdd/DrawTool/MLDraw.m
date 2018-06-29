//
//  MLDraw.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/6.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "MLDraw.h"

#import "MLDrawCanvasRule.h"

#import "MLDrawError.h"

@interface MLDraw ()
{
    CGContextRef _currentContext;
}

@property (nonatomic, strong) id<MLDrawCanvasRule> canvasRule;

@end

@implementation MLDraw

@dynamic currentContext;

- (instancetype)initWithRule:(id<MLDrawCanvasRule>)rule
{
    if (self = [super init]) {
        _canvasRule = rule;
    }
    return self;
}

- (void)generateDrawCanvas
{
    
}

#pragma mark - Properties

- (CGContextRef)currentContext
{
    if (_currentContext) {
        return _currentContext;
    }
    
    [self generateDrawCanvas];
    _currentContext = UIGraphicsGetCurrentContext();
    return _currentContext;
}

@end
