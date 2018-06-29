//
//  UIButton+MLCreate.m
//  TestCG_CGKit
//
//  Created by PCG on 2018/6/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UIButton+MLCreate.h"
#import "UIView+MLCreate.h"

@implementation UIButton (MLCreate)

@dynamic ml_enabled;
@dynamic ml_setTitle;
@dynamic ml_setAttributedTitle;
@dynamic ml_setImage;
@dynamic ml_setBackgroundImage;

#pragma mark - MLCreateButtonProtocol

+ (UIButton * _Nonnull (^)(UIButtonType))ml_button {
    return ^(UIButtonType buttonType) {
        return [self buttonWithType:buttonType];
    };
}

- (UIButton * _Nonnull (^)(BOOL))ml_enabled {
    return ^(BOOL enable) {
        if (self.isEnabled != enable) {
            self.enabled = enable;
        }
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSString * _Nonnull, UIControlState))ml_setTitle {
    return ^(NSString *title, UIControlState state) {
        if ([[self titleForState:state] isEqualToString:title]) {
            [self setTitle:title forState:state];
        }
        return self;
    };
}

- (UIButton * _Nonnull (^)(NSAttributedString * _Nonnull, UIControlState))ml_setAttributedTitle {
    return ^(NSAttributedString *attributedString, UIControlState state) {
        if ([[self attributedTitleForState:state] isEqualToAttributedString:attributedString]) {
            [self setAttributedTitle:attributedString forState:state];
        }
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIImage * _Nonnull, UIControlState))ml_setImage {
    return ^(UIImage *image, UIControlState state) {
        if ([self imageForState:state] != image) {
            [self setImage:image forState:state];
        }
        return self;
    };
}

- (UIButton * _Nonnull (^)(UIImage * _Nonnull, UIControlState))ml_setBackgroundImage
{
    return ^(UIImage *backgroundImage, UIControlState state) {
        if ([self backgroundImageForState:state] != backgroundImage) {
            [self setBackgroundImage:backgroundImage forState:state];
        }
        return self;
    };
}

//配置设置环境
//- (UIButton * _Nonnull (^)(UIControlState))ml_state
//{
//    return ^(UIControlState state){
//        [self._statesArray addObject:@(state)];
//        return self;
//    };
//}
//
//- (UIButton * _Nonnull (^)(UIImageRenderingMode))ml_imageRenderingMode
//{
//    return ^(UIImageRenderingMode mode) {
//        [self._imageRenderingModesArray addObject:@(mode)];
//        return self;
//    };
//}

//进行配置

//- (UIButton * _Nonnull (^)(NSString * _Nonnull))ml_title
//{
//    return ^(NSString *title) {
//
//    };
//}

@end

//#import <objc/runtime.h>
//
//@interface UIButton (_MLCreate)
//
//@property (nonatomic, strong) NSMutableArray<NSNumber *> *_statesArray;
//@property (nonatomic, strong) NSMutableArray<NSNumber *> *_imageRenderingModesArray;
//
//@end
//
//@implementation UIButton (_MLCreate)
//
//- (void)set_statesArray:(NSMutableArray<NSNumber *> *)_statesArray
//{
//    objc_setAssociatedObject(self, @selector(set_statesArray:), _statesArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (NSMutableArray<NSNumber *> *)_statesArray
//{
//    return objc_getAssociatedObject(self, _cmd);
//}
//
//- (void)set_imageRenderingModesArray:(NSMutableArray<NSNumber *> *)_imageRenderingModesArray
//{
//    objc_setAssociatedObject(self, @selector(set_imageRenderingModesArray:), _imageRenderingModesArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (NSMutableArray<NSNumber *> *)_imageRenderingModesArray
//{
//    return objc_getAssociatedObject(self, _cmd);
//}
//
//@end
