//
//  UIView+MLArea.h
//  TestCG_CGKit
//
//  Created by PCG on 2018/5/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - CGFloat
/** 计算 maxWith - (left + right) */
CG_INLINE CGFloat MLWidthWithMaxWidth(CGFloat maxWidth, UIEdgeInsets edgeInsets)
{
    return maxWidth - (edgeInsets.left + edgeInsets.right);
}

/** 计算 maxHeight - (top + bottom) */
UIKIT_STATIC_INLINE CGFloat MLHeightWithMaxHeight(CGFloat maxHeight, UIEdgeInsets edgeInsets)
{
    return maxHeight - (edgeInsets.top + edgeInsets.bottom);
}

/** 计算 left + width + right */
UIKIT_STATIC_INLINE CGFloat MLMaxWidthWithWidth(CGFloat width, UIEdgeInsets edgeInsets)
{
    return edgeInsets.left + width + edgeInsets.right;
}

/** 计算 top + height + bottom */
UIKIT_STATIC_INLINE CGFloat MLMaxHeightWithHeight(CGFloat height, UIEdgeInsets edgeInsets)
{
    return edgeInsets.top + height + edgeInsets.bottom;
}

/** 计算 fabs(w1 - w2) / 2.0 */
UIKIT_STATIC_INLINE CGFloat MLHorizonalMidPoint(CGFloat w1, CGFloat w2) {
    return fabs(w1 - w2) / 2.0;
}

UIKIT_STATIC_INLINE CGFloat MLCenterX(CGFloat x1, CGFloat x2) {
    return (x1 - x2) / 2.0;
}

/** 计算 fabs(h1 - h2) / 2.0  */
UIKIT_STATIC_INLINE CGFloat MLVerticalMidPoint(CGFloat h1, CGFloat h2) {
    return fabs(h1 - h2) / 2.0;
}

UIKIT_STATIC_INLINE CGFloat MLCenterY(CGFloat y1, CGFloat y2) {
    return (y1 - y2) / 2.0;
}

#pragma mark - CGSize
/** 计算 { maxWith - (left + right), maxHeight - (top + bottom) } */
UIKIT_STATIC_INLINE CGSize MLSizeWidthMaxSize(CGSize maxSize, UIEdgeInsets edgeInsets)
{
    return CGSizeMake(MLWidthWithMaxWidth(maxSize.width, edgeInsets), MLHeightWithMaxHeight(maxSize.height, edgeInsets));
}

/** 计算 { left + width + right, top + height + bottom } */
UIKIT_STATIC_INLINE CGSize MLMaxSizeWidthSize(CGSize size, UIEdgeInsets edgeInsets)
{
    return CGSizeMake(MLMaxWidthWithWidth(size.width, edgeInsets), MLMaxHeightWithHeight(size.height, edgeInsets));
}

/** 获取两个 CGSize 值中更小的 width 和 height 组成的 CGSize */
UIKIT_STATIC_INLINE CGSize MLMinSize(CGSize s1, CGSize s2)
{
    return CGSizeMake(MIN(s1.width, s2.width), MIN(s1.height, s2.height));
}

/** 获取两个 CGSize 中更大的 width 和 height 组成的 CGSize */
UIKIT_STATIC_INLINE CGSize MLMaxSize(CGSize s1, CGSize s2)
{
    return CGSizeMake(MAX(s1.width, s2.width), MAX(s1.height, s2.height));
}

#pragma mark - CGPoint

/** 计算 { p1.x + x, p1.y + y } */
UIKIT_STATIC_INLINE CGPoint MLPointWithOffset(CGPoint p1, CGFloat x, CGFloat y)
{
    return CGPointMake(p1.x + x, p1.y + y);
}

/** 计算 { p1.x + p2.x, p1.y + p2.y } */
UIKIT_STATIC_INLINE CGPoint MLPointWithOffsetPoint(CGPoint p1, CGPoint p2)
{
    return CGPointMake(p1.x + p2.x, p1.y + p2.y);
}

/** 获取 s1 的中心点 */
UIKIT_STATIC_INLINE CGPoint MLSizeCenter(CGSize s1)
{
    return CGPointMake(s1.width / 2.0, s1.height / 2.0);
}

/** 获取 s2 在 s1 居中时的起始坐标 */
UIKIT_STATIC_INLINE CGPoint MLCenterWith(CGSize s1, CGSize s2)
{
    return CGPointMake((s1.width - s2.width) / 2.0, (s1.height - s2.height) / 2.0);
}

/** { (p1.x + p2.x) / 2, (p1.y + p2.y) / 2 } */
UIKIT_STATIC_INLINE CGPoint MLMidPoint(CGPoint p1, CGPoint p2)
{
    return CGPointMake((p1.x + p2.x) / 2.0, (p1.y + p2.y) / 2.0);
}

#pragma mark - CGRect
/** 计算 { { left, top }, { width - (left + right), height - (top + bottom) } } */
UIKIT_STATIC_INLINE CGRect MLInnerFrameWithBounds(CGRect bounds, UIEdgeInsets insets)
{
    return CGRectMake(insets.left, insets.right, MLWidthWithMaxWidth(CGRectGetWidth(bounds), insets), MLHeightWithMaxHeight(CGRectGetHeight(bounds), insets));
}

/** 计算 { { originX - left, originY - top}, { width + left + right, height + top + bottom } } */
UIKIT_STATIC_INLINE CGRect MLOuterFrameWithFrame(CGRect frame, UIEdgeInsets edgeInsets)
{
    return CGRectMake(CGRectGetMinX(frame) - edgeInsets.left, CGRectGetMinY(frame) - edgeInsets.top, CGRectGetWidth(frame) + edgeInsets.left + edgeInsets.right, CGRectGetHeight(frame) + edgeInsets.top + edgeInsets.bottom);
}

/** 计算 { { originX + left, originY + top}, { width - left - right, height - top - bottom } } */
UIKIT_STATIC_INLINE CGRect MLInnerFrameWithFrame(CGRect frame, UIEdgeInsets edgeInsets)
{
    return CGRectMake(CGRectGetMinX(frame) + edgeInsets.left, CGRectGetMinY(frame) + edgeInsets.top, CGRectGetWidth(frame) - edgeInsets.left - edgeInsets.right, CGRectGetHeight(frame) - edgeInsets.top - edgeInsets.bottom);
}

/** 计算 { { 0, 0}, { width, height } } */
UIKIT_STATIC_INLINE CGRect MLBoundsWithFrame(CGRect frame)
{
    return CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
}

/** 计算 { { 0, 0 }, { width + (left + right), height + (top + bottom) } } */
UIKIT_STATIC_INLINE CGRect MLMaxBoundsWithFrame(CGRect frame, UIEdgeInsets edgeInsets)
{
    return CGRectMake(0, 0, CGRectGetWidth(frame) + edgeInsets.left + edgeInsets.right, CGRectGetHeight(frame) + edgeInsets.top + edgeInsets.bottom);
}

/** 忽略顶部 计算 { { left, originY }, { width - (left + right), height - (originY + bottom) } } */
UIKIT_STATIC_INLINE CGRect MLRectWithExcludeTop(CGRect rect, UIEdgeInsets edgeInsets, CGFloat originY)
{
    return CGRectMake(edgeInsets.left, originY, CGRectGetWidth(rect) - (edgeInsets.left + edgeInsets.right), rect.size.height - (originY + edgeInsets.bottom));
}

/** 忽略底部 计算 { { left, top }, { width - (left + right), height} } */
UIKIT_STATIC_INLINE CGRect MLRectWithExcludeBottom(CGRect rect, UIEdgeInsets edgeInsets, CGFloat height)
{
    return CGRectMake(edgeInsets.left, edgeInsets.top, CGRectGetWidth(rect) - (edgeInsets.left + edgeInsets.right), height);
}

/** 忽略垂直 计算 { { left, originY }, { width - (left + right), height } } */
UIKIT_STATIC_INLINE CGRect MLRectWithExcludeVertical(CGRect rect, UIEdgeInsets insets, CGFloat originY, CGFloat height)
{
    return CGRectMake(insets.left, originY, CGRectGetWidth(rect) - (insets.left + insets.right), height);
}

/** 忽略右边 计算 { { left, top }, { width , height - (top + bottom) } } */
UIKIT_STATIC_INLINE CGRect MLRectWithExcludeRight(CGRect rect, UIEdgeInsets edgeInsets, CGFloat width)
{
    return CGRectMake(edgeInsets.left, edgeInsets.top, width, CGRectGetHeight(rect) - (edgeInsets.top + edgeInsets.bottom));
}

/** 忽略左边 计算 { { originX, top }, { width - (originX + right), height - (top + bottom) } }  */
UIKIT_STATIC_INLINE CGRect MLRectWithExcludeLeft(CGRect rect, UIEdgeInsets edgeInsets, CGFloat originX) {
    return CGRectMake(originX, edgeInsets.top, CGRectGetWidth(rect) - (originX + edgeInsets.right), CGRectGetHeight(rect) - (edgeInsets.top + edgeInsets.bottom));
}

/** 忽略水平 计算 { { originX, top }, { width , height - (top + bottom) } */
UIKIT_STATIC_INLINE CGRect MLRectWithExcludeHorizontal(CGRect rect, UIEdgeInsets edgeInsets, CGFloat originX, CGFloat width)
{
    return CGRectMake(originX, edgeInsets.top, width, CGRectGetHeight(rect) - (edgeInsets.top + edgeInsets.bottom));
}

/** 计算 { position, size } */
UIKIT_STATIC_INLINE CGRect MLRectWithMake(CGPoint position, CGSize size)
{
    return CGRectMake(position.x, position.y, size.width, size.height);
}

/** 计算 { {center.x - width / 2, centr.y - height / 2 }, size } */
UIKIT_STATIC_INLINE CGRect MLRectWithCenterMake(CGPoint center, CGSize size)
{
    return CGRectMake(center.x - size.width / 2.0, center.y - size.height / 2.0, size.width, size.height);
}

@interface UIView (MLArea)

#pragma mark - 设置区域

/**
 设置指定 size 的整体区域居中
 @param block 返回 size 在 self 中的 frame
 */
- (void)setupCenterWithSize:(CGSize)size margin:(UIEdgeInsets)margin offset:(CGPoint)offset block:(void (^) (CGRect frame))block;

@end

NS_ASSUME_NONNULL_END
