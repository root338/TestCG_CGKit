////
////  MLFramePathTool.m
////  TestCG_CGKit
////
////  Created by PCG on 2018/5/26.
////  Copyright © 2018年 apple. All rights reserved.
////
//
//#import "MLFramePathTool.h"
//
//@interface MLFramePathTool ()
//{
//    
//}
//
//@property (nonatomic, assign) CGMutablePathRef currentPath;
//
//@end
//
//@implementation MLFramePathTool
//
//+ (nullable CGPathRef)createPathWithPathRule:(id<MLFramePathProtocol>)framePath error:(NSError *__autoreleasing  _Nullable *)error
//{
//    MLFramePathTool *framePathTool = [[self alloc] init];
//    CGPathRef path = [framePathTool pathRule:framePath error:error];
//    return CGPathCreateCopy(path);
//}
//
//+ (BOOL)verifyRuleIsAvailableWithError:(NSError *__autoreleasing  _Nullable *)error
//{
//    return YES;
//}
//
//- (CGPathRef)pathRule:(id<MLFramePathProtocol>)rule error:(NSError *__autoreleasing  _Nullable *)error
//{
//    _currentPath   = CGPathCreateMutable();
//    CGAffineTransform *m    = NULL;
//    CGFloat radius          = rule.cornerRadius;
//    CGRect drawFrame        = CGRectMake(0, 0, rule.size.width, rule.size.height);
//    
//    CGPoint endPoint    = CGPointZero;
//    CGFloat minX = CGRectGetMinX(drawFrame);
//    CGFloat minY = CGRectGetMinY(drawFrame);
//    CGFloat maxX = CGRectGetMaxX(drawFrame);
//    CGFloat maxY = CGRectGetMaxY(drawFrame);
//    CGFloat height = CGRectGetHeight(drawFrame);
//    
//    if (rule.corners & UIRectCornerTopLeft) {
//        CGPathMoveToPoint(_currentPath, m, minX, minY + height / 2.0);
//        endPoint        = CGPathGetCurrentPoint(_currentPath);        CGPathAddArcToPoint(_currentPath, m, minX, minY, maxX, minY, radius);
//    }else {
//        CGPathMoveToPoint(_currentPath, m, minX, minY);
//        endPoint        = CGPathGetCurrentPoint(_currentPath);
//    }
//    
//    if (rule.corners & UIRectCornerTopRight) {
//        CGPathAddArcToPoint(_currentPath, m, maxX, minY, maxX, maxY, radius);
//    }else {
//        CGPathAddLineToPoint(_currentPath, m, maxX, minY);
//    }
//    
//    if (rule.corners & UIRectCornerBottomRight) {
//        CGPathAddArcToPoint(_currentPath, m, maxX, maxY, minX, maxY, radius);
//    }else {
//        CGPathAddLineToPoint(_currentPath, m, maxX, maxY);
//    }
//    
//    if (rule.corners & UIRectCornerBottomLeft) {
//        CGPathAddArcToPoint(_currentPath, m, minX, maxY, endPoint.x, endPoint.y, radius);
//    }else {
//        CGPathAddLineToPoint(_currentPath, m, minX, maxY);
//    }
//    
//    if (!CGPointEqualToPoint(endPoint, CGPathGetCurrentPoint(_currentPath))) {
//        CGPathAddLineToPoint(_currentPath, m, endPoint.x, endPoint.y);
//    }
//    
//    return _currentPath;
//}
//
//- (void)dealloc
//{
//    CGPathRelease(_currentPath);
//}
//
//- (CGMutablePathRef)currentPath
//{
//    if (_currentPath) {
//        return _currentPath;
//    }
//    
//    _currentPath = CGPathCreateMutable();
//    
//    return _currentPath;
//}
//
//- (CGPathRef)path
//{
//    return self.currentPath;
//}
//
//@end

